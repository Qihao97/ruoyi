package com.ruoyi;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 * 
 * @author ruoyi
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
@MapperScan("com.ruoyi.*.mapper")
public class RuoYiApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(RuoYiApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  睿腾启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                " .-------.       .--------------.    \n" +
                " |  _ _   \\      |__o__    __o__|    \n" +
                " | ( ' )  |            |  |          \n" +
                " |(_ o _) /            |__|          \n" +
                " | (_,_).'   __        (__)          \n" +
                " |  |\\ \\  |  |         |  |          \n" +
                " |  | \\ `'   /         (oo)          \n" +
                " |  |  \\    /          |  |          \n" +
                " ''-'   `'-'           `--'           ");
    }
}