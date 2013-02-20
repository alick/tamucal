# 插件：用THUCAL轻松导出清华本科生课程表！
_by [smilekzs][]_

##特点

* 完美解决各种不规则时间课程问题（实验课，1大节3小节课，等等）
* 直接生成iCalendar文件，方便导入各种日历app
* 导出工作完全本地完成，不泄露隐私

##效果

![][result]

##下载 安装

* Chrome：先安装[TamperMonkey][]环境
* Safari：先安装[NinjaKit][]环境
* Firefox: 先安装[GreaseMonkey][]环境
* 其他: <sub>我可以无耻地推荐大家用Chrome么（逃</sub>

[TamperMonkey]: https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo
[NinjaKit]: http://ss-o.net/safari/extension/NinjaKit.safariextz
[GreaseMonkey]: https://addons.mozilla.org/en-US/firefox/addon/greasemonkey/

安装完成后，即可下载安装本userscript：  
http://userscripts.org/scripts/show/159785

##使用方法

1. 登录info，打开选课系统，点`整体课表`  
   ![][step1-1]  

2. 点右上角多出的`THUCAL`按钮  
   ![][step2-1]  

3. 下方出现提示，若成功，浏览器会下载一个`thucal-xxxx-xxxx-x.ics`文件，即为导出的日历  
   ![][step3-1]  

4. 将该文件导入支持iCalendar格式的日历app中。如：[Google Calendar导入日历][gcal1]。  
   ![][step4-1]  

##问题反馈

大家使用中如果遇到什么问题，欢迎在原日志/[github][issue]与我讨论～

[smilekzs]: https://github.com/smilekzs
[repo]: https://github.com/smilekzs/thucal2
[issue]: https://github.com/smilekzs/thucal2/issues


[gcal1]: http://support.google.com/calendar/bin/answer.py?hl=zh-Hans&answer=83126

[step1-1]: http://i.imgur.com/OxO5RMg.png
[step2-1]: http://i.imgur.com/SXHWGwW.png
[step3-1]: http://i.imgur.com/IhH4vu0.png
[step4-1]: http://i.imgur.com/6oMMJqy.png
[result]:  http://i.imgur.com/96uOClz.png