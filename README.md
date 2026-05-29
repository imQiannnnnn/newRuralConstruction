# 新农村建设信息管理系统

## 项目简介

新农村建设信息管理系统是一个前后端分离的 Web 管理系统，包含用户端和管理端两类使用场景。系统围绕乡村建设信息展示、农产品交易、旅游景点展示、微心愿管理、公告发布、评论互动、用户管理和文件管理等功能展开。

后端使用 Spring Boot 提供 REST API，前端使用 Vue 2 和 Element UI 构建页面，数据库使用 MySQL

## 功能模块

- 用户登录、注册、个人信息维护
- 党员/群众角色登录入口
- 管理员用户管理
- 公告信息管理与展示
- 旅游景点信息管理与展示
- 农产品信息管理与展示
- 购物车和订单管理，支持下单、发货、收货
- 微心愿发布、查看、完成和统计
- 评论发布、回复、列表展示和后台管理
- 文件上传、访问、启用禁用和删除
- Excel 数据导入导出
- 用户性别、年龄统计图表
- Swagger 接口文档

## 技术栈

### 后端

- Java 8
- Spring Boot 2.7.0
- Spring MVC
- Spring Security
- MyBatis-Plus 3.5.1
- MySQL
- JWT
- Hutool
- Apache POI
- Swagger 2
- Lombok

### 前端

- Vue 2.6.14
- Vue Router 3.5.1
- Vuex 3.6.2
- Element UI 2.15.13
- Axios
- ECharts
- Vue CLI 5

## 项目结构

```text
newRuralConstruction
├── README.md
├── rural_manage_system.sql          # MySQL 数据库脚本
├── files/                           # 上传文件保存目录
├── ruralmanagement/                 # Spring Boot 后端项目
│   ├── pom.xml
│   └── src/main
│       ├── java/com/example/ruralmanagement
│       │   ├── common/              # 通用返回结果、常量
│       │   ├── config/              # 跨域、拦截器、Swagger、MyBatis 配置
│       │   ├── controller/          # 控制器接口
│       │   ├── entity/              # 实体类和 VO
│       │   ├── exception/           # 全局异常处理
│       │   ├── mapper/              # Mapper 接口
│       │   ├── service/             # 业务接口
│       │   ├── service/impl/        # 业务实现
│       │   └── utils/               # Token、代码生成、日期处理工具
│       └── resources
│           ├── application.yml      # 后端配置
│           └── mapper/              # MyBatis XML 映射文件
└── vue/ruralsystem/                 # Vue 前端项目
    ├── package.json
    ├── public/
    └── src/
        ├── assets/                  # 静态资源
        ├── components/              # 公共组件
        ├── router/                  # 路由配置
        ├── store/                   # Vuex 状态管理
        ├── utils/                   # Axios 请求封装
        └── views/                   # 页面视图
            ├── admin/               # 管理端页面
            └── user/                # 用户端页面
```

## 数据库说明

项目数据库名：

```text
rural_manage_system
```

数据库脚本：

```text
rural_manage_system.sql
```

脚本中包含以下数据表：

| 表名 | 说明 |
| --- | --- |
| `tb_user` | 用户信息表 |
| `tb_notice` | 公告信息表 |
| `tb_scene` | 旅游景点信息表 |
| `tb_produce` | 农产品信息表 |
| `tb_purchase` | 购物车/订单信息表 |
| `tb_wish` | 微心愿信息表 |
| `tb_comment` | 评论信息表 |
| `tb_file` | 文件信息表 |

### 导入数据库

先创建数据库：

```sql
CREATE DATABASE rural_manage_system DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```

再导入 SQL 文件：

```bash
mysql -u root -p rural_manage_system < rural_manage_system.sql
```

也可以使用 Navicat、DataGrip、MySQL Workbench 等工具打开 `rural_manage_system.sql` 后执行。

后端默认数据库配置位于：

```text
ruralmanagement/src/main/resources/application.yml
```

默认配置为：

```yaml
spring:
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://localhost:3306/rural_manage_system?useUnicode=true&characterEncoding=utf-8
    username: root
    password: 123456
```

如果本地 MySQL 的账号、密码或端口不同，请修改 `application.yml`。

### 默认账号

SQL 脚本中包含部分初始化用户，可用于本地测试：

| 用户名 | 密码 | 角色 | 权限 |
| --- | --- | --- | --- |
| `admin` | `admin` | 中共预备党员 | 超级管理员 |
| `李明明` | `123456` | 群众 | 普通用户 |
| `何家` | `123456` | 中共预备党员 | 党员用户 |
| `李响` | `123456` | 中共预备党员 | 党员用户 |
| `陌陌` | `123456` | 中共党员 | 党员用户 |

登录页会根据选择的登录身份进入不同页面：党员身份进入管理端，群众身份进入用户端。

## 文件上传配置

后端上传目录配置在 `application.yml`：

```yaml
files:
  upload:
    path: F:/IDEA_project/newRuralConstruction/files/
```

如果项目路径不是该目录，请改为本机实际路径。例如当前项目可配置为：

```yaml
files:
  upload:
    path: F:/project_qian/newRuralConstruction/files/
```

## 环境要求

- JDK 1.8
- Maven 3.x
- MySQL 8.x，脚本导出版本为 MySQL 8.0.25
- Node.js 14+ 或 16+
- npm

## 后端启动

进入后端目录：

```bash
cd ruralmanagement
```

启动 Spring Boot：

```bash
mvn spring-boot:run
```

后端默认访问地址：

```text
http://localhost:8888
```

Swagger 接口文档：

```text
http://localhost:8888/swagger-ui.html
```

## 前端启动

进入前端目录：

```bash
cd vue/ruralsystem
```

启动开发服务：

```bash
npm run serve
```

前端接口请求地址配置在：

```text
vue/ruralsystem/src/utils/request.js
```

默认请求后端：

```text
http://localhost:8888
```

## 前端构建

```bash
cd vue/ruralsystem
npm run build
```

## 主要接口

| 模块 | 基础路径 | 说明 |
| --- | --- | --- |
| 用户 | `/user` | 登录、注册、用户管理、用户统计 |
| 公告 | `/notice` | 公告增删改查、导入导出 |
| 景点 | `/scene` | 旅游景点增删改查、导入导出 |
| 农产品 | `/produce` | 农产品增删改查、分页查询、导入导出 |
| 订单 | `/purchase` | 购物车、下单、批量下单、发货、收货 |
| 微心愿 | `/wish` | 微心愿发布、完成、我的心愿、月份统计 |
| 评论 | `/comment` | 评论增删改查、文章评论列表 |
| 文件 | `/file` | 文件上传、下载、文件管理 |

## 启动顺序

1. 启动 MySQL。
2. 创建数据库 `rural_manage_system`。
3. 导入 `rural_manage_system.sql`。
4. 修改 `application.yml` 中的数据库账号、密码和文件上传路径。
5. 启动后端 `mvn spring-boot:run`。
6. 启动前端 `npm run serve`。
7. 访问前端页面并使用默认账号登录。

## 开发说明

- 后端统一返回结果封装在 `Result` 类中。
- 后端使用 MyBatis-Plus 提供基础 CRUD 能力，复杂查询通过 Mapper XML 扩展。
- 前端通过 Axios 拦截器统一设置 `Content-Type` 和 `token` 请求头。
- 管理端页面位于 `vue/ruralsystem/src/views/admin`。
- 用户端页面位于 `vue/ruralsystem/src/views/user`。
- 新增业务模块时，可按 `entity -> mapper -> service -> controller -> 前端页面` 的顺序开发。
