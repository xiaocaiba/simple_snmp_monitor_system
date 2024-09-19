#include <stdio.h>
#include <stdlib.h>
#include <net-snmp/net-snmp-config.h>
#include <net-snmp/net-snmp-includes.h>
#include <string.h>
#include <mysql/mysql.h>
#include<libconfig.h>


#define BULK_MAX_REPETITIONS 36
#define MAX_LEN 128

struct if_data_node {
    char ip[128];                  //监控主机的ip
    int port;                  //端口号
    char sysName[128];         //系统名
    long ifInOctets;           //接口接收到的字节数
    long ifInUcastpkts;        //接口接收到的单播数据包数
    long ifInNUcastpkts;       //接口接收到的非单播数据包数
    long ifInErrors;           //接口接收错误的数目
    long ifOutOctets;          //接口发送的字节数
    long ifOutUcastpkts;       //接口发送的单播数据包数
    long ifOutNUcastpkts;      //接口发送的非单播数据包数
    long ifOutErrors;          //接口发送错误的数目
};

struct device_info {
    char ip[128];
    int if_in_use;
    int first_interface;
};

struct oid_mapping {
    char* name;
    char* oid;
};

int device_number = 0;        //全局变量设备数量，通过配置改变

int total_objects_number = 0;          //oid数量

struct device_info* monitor_devices;          //存储要监控的设备信息

char(*dest_oids)[MAX_LEN];        //指向char数组的指针，存储要监控的指标

struct oid_mapping oid_map[] = {
    {"sysName.0", ".1.3.6.1.2.1.1.5.0"},
    {"ifInOctets", ".1.3.6.1.2.1.2.2.1.10"},
    {"ifInUcastPkts", ".1.3.6.1.2.1.2.2.1.11"},
    {"ifInNUcastPkts", ".1.3.6.1.2.1.2.2.1.12"},
    {"ifInErrors", ".1.3.6.1.2.1.2.2.1.14"},
    {"ifOutOctets", ".1.3.6.1.2.1.2.2.1.16"},
    {"ifOutUcastPkts", ".1.3.6.1.2.1.2.2.1.17"},
    {"ifOutNUcastPkts", ".1.3.6.1.2.1.2.2.1.18"},
    {"ifOutErrors", ".1.3.6.1.2.1.2.2.1.20"}
};

//解析函数，把STRING头去掉，只保留“ 里的内容
void extract_string_value(const char* buf, char* result, size_t result_size) {
    const char* start = strchr(buf, '\"');
    if (start) {
        start++;
        const char* end = strchr(start, '\"');
        if (end) {
            size_t length = end - start;
            if (length < result_size) {
                strncpy(result, start, length);
                result[length] = '\0';
            }
        }
    }
}
//解析函数，只保留Counter32的值
long extract_counter_value(const char* buf) {
    const char* start = strchr(buf, ':');
    if (start) {
        start++;
        return strtoul(start, NULL, 10);
    }
    return 0;
}

void analysis_response(const char* dest_oid, struct if_data_node* monitor_data_node, netsnmp_variable_list* resp, int which_port)
{

    char buf[128];
    snprint_value(buf, sizeof(buf), resp->name, resp->name_length, resp);
    //printf("解析后的值,但是包含类型，需要再解析：%s\n", buf);

    if (strcmp(dest_oid, dest_oids[0]) == 0) {  //sysName

        char result_string[128];
        extract_string_value(buf, result_string, sizeof(result_string));

        for (int i = 0;i < which_port;i++) {   //sysName只传一次，但是要写多次，所以这时候which_port表示在用端口数量

            strncpy(monitor_data_node[i].sysName, result_string, sizeof(monitor_data_node[i].sysName) - 1);
        }

    }
    else if (strcmp(dest_oid, dest_oids[1]) == 0) {   //ifInOctets

        long result = extract_counter_value(buf);       //将字符串形式转换为long
        monitor_data_node[which_port].ifInOctets = result;
    }
    else if (strcmp(dest_oid, dest_oids[2]) == 0) {   //ifInUcastPkts

        long result = extract_counter_value(buf);       //将字符串形式转换为long
        monitor_data_node[which_port].ifInUcastpkts = result;

    }
    else if (strcmp(dest_oid, dest_oids[3]) == 0) {  //ifInNUcastPkts

        long result = extract_counter_value(buf);       //将字符串形式转换为long
        monitor_data_node[which_port].ifInNUcastpkts = result;

    }
    else if (strcmp(dest_oid, dest_oids[4]) == 0) {  //  ifInErrors

        long result = extract_counter_value(buf);       //将字符串形式转换为long
        monitor_data_node[which_port].ifInErrors = result;

    }
    else if (strcmp(dest_oid, dest_oids[5]) == 0) {   //ifOutOctets

        long result = extract_counter_value(buf);       //将字符串形式转换为long
        monitor_data_node[which_port].ifOutOctets = result;

    }
    else if (strcmp(dest_oid, dest_oids[6]) == 0) {   //ifOutUcastPkts

        long result = extract_counter_value(buf);       //将字符串形式转换为long
        monitor_data_node[which_port].ifOutUcastpkts = result;

    }
    else if (strcmp(dest_oid, dest_oids[7]) == 0) {    //ifOutNUcastPkts

        long result = extract_counter_value(buf);       //将字符串形式转换为long
        monitor_data_node[which_port].ifOutNUcastpkts = result;

    }
    else if (strcmp(dest_oid, dest_oids[8]) == 0) {   //  ifOutErrors

        long result = extract_counter_value(buf);       //将字符串形式转换为long
        monitor_data_node[which_port].ifOutErrors = result;

    }
    else {
        printf("oid都没匹配上, 没进入写结构体的if\n");
    }

}

void finish_with_error(MYSQL* con) {
    fprintf(stderr, "写表发生错误，原因:  %s\n", mysql_error(con));
    mysql_close(con);
    exit(1);
}

int write_to_table(MYSQL* con, struct if_data_node* monitor_data_node, int length) {

    for (int i = 0; i < length; i++) {
        char query[512];
        snprintf(query, sizeof(query),
            "INSERT INTO monitor_data (ip, port, sysName, ifInOctets, ifInUcastpkts, ifInNUcastpkts, ifInErrors, ifOutOctets, ifOutUcastpkts, ifOutNUcastpkts, ifOutErrors) "
            "VALUES ('%s', %d, '%s', %ld, %ld, %ld, %ld, %ld, %ld, %ld, %ld)",
            monitor_data_node[i].ip, monitor_data_node[i].port, monitor_data_node[i].sysName,
            monitor_data_node[i].ifInOctets, monitor_data_node[i].ifInUcastpkts, monitor_data_node[i].ifInNUcastpkts, monitor_data_node[i].ifInErrors,
            monitor_data_node[i].ifOutOctets, monitor_data_node[i].ifOutUcastpkts, monitor_data_node[i].ifOutNUcastpkts, monitor_data_node[i].ifOutErrors);

        if (mysql_query(con, query)) {
            finish_with_error(con);
        }
    }

    return 0;
}

const char* get_oid_from_name(const char* name) {
    for (int i = 0; i < sizeof(oid_map) / sizeof(oid_map[0]); i++) {
        if (strcmp(oid_map[i].name, name) == 0) {
            return oid_map[i].oid;
        }
    }
    return NULL;
}
int main(int argc, char** argv) {

    struct snmp_session session, * ss;
    struct snmp_pdu* pdu;
    struct snmp_pdu* response;
    struct variable_list* vars;    //应答报文中的变量绑定

    oid rootOID[MAX_OID_LEN];
    size_t rootOID_len;
    int status;

    config_t cfg;       //读配置的句柄，指定打开的文件名，数量，定义分隔符
    config_setting_t* setting;      //读每个模块的信息
    const char* str;
    int count;

    // 初始化配置，在内存中生成config_t结构体并初始化，将指向该结构体的指针保存在cfg
    config_init(&cfg);

    // 读取配置文件，并解析
    if (!config_read_file(&cfg, "device_config.cfg")) {
        fprintf(stderr, "%s:%d - %s\n", config_error_file(&cfg),
            config_error_line(&cfg), config_error_text(&cfg));
        config_destroy(&cfg);
        return EXIT_FAILURE;
    }

    // 读取设备信息  ，path即为key，按key查找value
    setting = config_lookup(&cfg, "devices");
    if (setting != NULL) {

        device_number = config_setting_length(setting);

        monitor_devices = malloc(device_number * sizeof(struct device_info));
        if (monitor_devices == NULL) {
            fprintf(stderr, "Memory allocation for devices failed\n");
            return 1;
        }

        for (int i = 0; i < device_number; ++i) {

            config_setting_t* device = config_setting_get_elem(setting, i);

            if (!(config_setting_lookup_string(device, "ip", &str)
                && config_setting_lookup_int(device, "if_in_use", &monitor_devices[i].if_in_use)
                && config_setting_lookup_int(device, "first_interface", &monitor_devices[i].first_interface))) {
                continue;
            }

            strncpy(monitor_devices[i].ip, str, sizeof(monitor_devices[i].ip));
        }

        printf("Devices:\n");
        for (int i = 0; i < device_number; ++i) {
            printf("IP: %s\t, If in use: %d\t, First interface: %d\n", monitor_devices[i].ip, monitor_devices[i].if_in_use, monitor_devices[i].first_interface);
        }

    }

    // 读取 OID 信息
    setting = config_lookup(&cfg, "oids");
    if (setting != NULL) {

        total_objects_number = config_setting_length(setting);

        dest_oids = malloc(total_objects_number * sizeof(char[MAX_LEN]));
        if (dest_oids == NULL) {
            fprintf(stderr, "Memory allocation for oids failed\n");
            return 1;
        }

        for (int i = 0; i < total_objects_number; ++i) {

            str = config_setting_get_string_elem(setting, i);

            if (str) {

                const char* oid = get_oid_from_name(str);   //转换成标准的标识符
                strncpy(dest_oids[i], oid, MAX_LEN);
            }
            else {
                fprintf(stderr, "Unknown OID name: %s\n", str);
                strncpy(dest_oids[i], "", MAX_LEN);
            }
        }

        printf("OIDs:\n");
        for (int i = 0; i < total_objects_number; ++i) {
            printf("%s\n", dest_oids[i]);
        }

    }

    MYSQL* con = mysql_init(NULL);

    if (con == NULL) {
        fprintf(stderr, "mysql_init() failed\n");
        return EXIT_FAILURE;
    }

    if (mysql_real_connect(con, "localhost", "root", "123456", "ensp_monitor", 0, NULL, 0) == NULL) {
        finish_with_error(con);
    }

    for (int i = 0; i < device_number; i++)  //主循环，每个ip请求一遍所有oid
    {
        //动态根据每个设备有几个在用端口号，分配几个结构体
        struct if_data_node* monitor_data_node = malloc(monitor_devices[i].if_in_use * sizeof(struct if_data_node));

        if (monitor_data_node == NULL) {
            perror("Failed to allocate memory for monitor_data_node");
            exit(1);
        }

        // Initialize the SNMP library
        init_snmp("snmp_huawei");

        // Initialize a "session" that defines who we are going to talk to
        snmp_sess_init(&session);
        session.peername = strdup(monitor_devices[i].ip);
        if (session.peername == NULL) {
            perror("Failed to allocate memory for peername");
            free(monitor_data_node);
            exit(1);
        }

        // Set the SNMP version number
        session.version = SNMP_VERSION_2c;

        // Set the SNMPv1/2c community name used for authentication
        session.community = (u_char*)"public";
        session.community_len = strlen((const char*)session.community);

        // Open the session
        ss = snmp_open(&session);    //对每一个ip构建一个session
        if (!ss) {
            snmp_perror("ack");
            snmp_log(LOG_ERR, "something error happened when open a session!!!\n");
            free(monitor_data_node);
            free(session.peername);
            exit(2);
        }

        for (int j = 0; j < total_objects_number; j++) {    //对每一个指标进行bluck查询

            // Parse the root OID into the OID array
            rootOID_len = MAX_OID_LEN;
            if (!read_objid(dest_oids[j], rootOID, &rootOID_len)) {
                snmp_perror("read_objid error");
                snmp_close(ss);
                free(monitor_data_node);
                free(session.peername);
                exit(1);
            }

            if (strcmp(dest_oids[j], ".1.3.6.1.2.1.1.5.0") == 0) { // sysName.0 需要使用GET类型数据包，bluck类型是用get-next来的
                pdu = snmp_pdu_create(SNMP_MSG_GET);
            }
            else {
                // Create the bluck PDU for the data for our request
                pdu = snmp_pdu_create(SNMP_MSG_GETBULK);
                pdu->non_repeaters = 0;
                pdu->max_repetitions = BULK_MAX_REPETITIONS;
            }
            // Add the root OID to the request
            snmp_add_null_var(pdu, rootOID, rootOID_len);   //发送request

            int count_flag = 1;       //计数器，用来标识请求到了第几个端口的数据

            if ((status = snmp_synch_response(ss, pdu, &response)) == STAT_SUCCESS && response->errstat == SNMP_ERR_NOERROR)
            {
                // Process the response，对每个变量进行遍历
                for (vars = response->variables; vars; vars = vars->next_variable) {

                    if (strcmp(dest_oids[j], ".1.3.6.1.2.1.1.5.0") == 0) {   //sysName这个目标用的是Get请求，所以只能传一次，但是要写多次
                        analysis_response(dest_oids[j], monitor_data_node, vars, monitor_devices[i].if_in_use);
                    }
                    else if (count_flag >= monitor_devices[i].first_interface && count_flag < monitor_devices[i].first_interface + monitor_devices[i].if_in_use) {
                        int which_port = count_flag - monitor_devices[i].first_interface;
                        //printf("校验写入报文的端口号是否正确：%d\n", which_port);     //which_port是对应的结构体的标号，R1是正确的，交换机写入表是需要加1
                        analysis_response(dest_oids[j], monitor_data_node, vars, which_port);
                        //dest_oids[j]用来标识是哪个oid    存储的结构体       值    是第几个端口的数据

                    }
                    count_flag++;
                }

                snmp_free_pdu(response);
            }
            //printf("\n\n\n");

            //执行完了请求下一个oid
        }

        //printf("\n\n\n\n\n\n\n");
        //填入ip
        for (int p = 0;p < monitor_devices[i].if_in_use;p++) {

            strncpy(monitor_data_node[p].ip, monitor_devices[i].ip, sizeof(monitor_devices[i].ip));
        }
        //填入端口号
        if (strcmp(monitor_devices[i].ip, "10.1.2.1") == 0) {
            for (int p = 0;p < monitor_devices[i].if_in_use;p++) {
                monitor_data_node[p].port = p;
            }
        }
        else {
            for (int p = 0;p < monitor_devices[i].if_in_use;p++) {
                monitor_data_node[p].port = p + 1;
            }
        }

        printf("最后看结构体内的数据是否正确：\n");
        for (int p = 0;p < monitor_devices[i].if_in_use;p++)
        {
            printf("%s\n", monitor_data_node[p].sysName);
            printf("%s\n", monitor_data_node[p].ip);
            printf("%d\n", monitor_data_node[p].port);

            printf("%ld\n", monitor_data_node[p].ifInOctets);
            printf("%ld\n", monitor_data_node[p].ifInUcastpkts);
            printf("%ld\n", monitor_data_node[p].ifInNUcastpkts);
            printf("%ld\n", monitor_data_node[p].ifInErrors);
            printf("出口数据\n");
            printf("%ld\n", monitor_data_node[p].ifOutOctets);
            printf("%ld\n", monitor_data_node[p].ifOutUcastpkts);
            printf("%ld\n", monitor_data_node[p].ifOutNUcastpkts);
            printf("%ld\n", monitor_data_node[p].ifOutErrors);
            printf("\n\n\n");
        }

        write_to_table(con, monitor_data_node, monitor_devices[i].if_in_use);

        free(monitor_data_node);
        snmp_close(ss);
        free(session.peername);
    }

    free(monitor_devices);
    mysql_close(con);
    config_destroy(&cfg);
    return 0;
}


