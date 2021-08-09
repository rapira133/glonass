<h1 align="center">glonass</h1>

<p align="center">

<img src="https://img.shields.io/badge/made%20for-GTA%20SA--MP-blue" >

<img src="https://img.shields.io/badge/Server-Samp--Rp-red">

<img src="https://img.shields.io/github/languages/top/qrlk/glonass">

<img src="https://img.shields.io/badge/dynamic/json?color=blueviolet&label=users%20%28active%29&query=result&url=http%3A%2F%2Fqrlk.me%2Fdev%2Fmoonloader%2Fusers_active.php%3Fscript%3Dglonass">

<img src="https://img.shields.io/badge/dynamic/json?color=blueviolet&label=users%20%28all%20time%29&query=result&url=http%3A%2F%2Fqrlk.me%2Fdev%2Fmoonloader%2Fusers_all.php%3Fscript%3Dglonass">

<img src="https://img.shields.io/date/1508792400?label=released" >

</p>

A **[moonloader](https://gtaforums.com/topic/890987-moonloader/)** script for quick exchange of coordinates between players via faction's chat in **[gta samp](https://sa-mp.com/)**.

It also requires **[CLEO 4+](http://cleo.li/?lang=ru)**, **[SAMPFUNCS 5+](https://blast.hk/threads/17/)** and **[SAMP.Lua](https://github.com/THE-FYP/SAMP.Lua)**.

---

**The following description is in Russian, because it is the main language of the user base**.
<details>
  <summary>Описание на русском языке.</summary>
  
# Описание 
Как-то я писал функцию для определения квадрата, в котором находится игрок, и мне в голову пришла мысль, что эти квадраты устарели и вообще не нужны. Ведь намного проще передать точные координаты через чат и принять эти же координаты из чата, чем искать квадрат по карте. Знакомтесь, **GLONASS**.  

* Если вкратце, то скрипт даёт возможность отправляет и принимать координаты в рацию (/r).  
* Предназначен для Samp-Rp.
* Если кто-то их примет, то он ответит в /r по форме "10-14 %вызов%, дистанция: "%дистанция% м." и у него появится пикап и метка на этих координатах.  
* Всего есть 12 сценариев, которые были написаны под байкеров, но могут быть использованы везде где угодно.  
* Бонусом скрипт захватывает последний написанный в чате квадрат, в центр которого может поставить метку.  
* Стоит заметить, что в интерьере координаты не обновляются, т.е. если вызвать помощь в интерьере, то вызов отправится по тем последним координатам вне интерьера.  
* В скрипте реализовано автообновление, которое можно вырубить в настройках.  

**Требования:** [CLEO 4+](http://cleo.li/?lang=ru), [SAMPFUNCS 5.3.3](https://blast.hk/threads/17/), [MoonLoader](https://blast.hk/threads/13305/), [SAMP.Lua](https://blast.hk/threads/14624/).  
**Активация:** Скрипт активируется автоматически. У скрипта нет настроек, поэтому автообновление, телеметрию и уведомление при входе можно отключить только вручную, вырезав блокнотом по линии в коде.

* **P** - вызвать меню вызова помощи.
* **]** - вызвать меню принятия помощи.
* **Z** - быстро принять последний вызов.
* **/glean** - удалить все созданные скриптом метки и пикапы, остановить динамические процессы.
* **/glonass** - открыть меню скрипта.

**Автор:** [qrlk](http://qrlk.me/samp).  
**Обсуждение в группе VK:** [ссылка](https://vk.com/topic-168860334_38597266).

# Скриншот
![https://i.imgur.com/kGt5qJi.png](https://i.imgur.com/kGt5qJi.png)  
![https://i.imgur.com/0lIM4lS.png](https://i.imgur.com/0lIM4lS.png)  
![https://i.imgur.com/3W1ARBa.png](https://i.imgur.com/3W1ARBa.png)  
![https://i.imgur.com/25KTMBQ.png](https://i.imgur.com/25KTMBQ.png)
# Видео
На видео обзор очень ранней версии, записано 19 октября. С тех пор многое было измененилось, но основные принципы понятны. Сейчас нет возможности переснять.  
[![Открыть](https://img.youtube.com/vi/OOPOaqNHHho/0.jpg)](https://www.youtube.com/watch?v=OOPOaqNHHho)
</details>
