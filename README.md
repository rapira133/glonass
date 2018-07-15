# Описание 
Как-то я писал функцию для определения квадрата, в котором находится игрок, и мне в голову пришла мысль, что эти квадраты устарели и вообще не нужны. Ведь намного проще передать точные координаты через чат и принять эти же координаты из чата, чем искать квадрат по карте. Знакомтесь, **GLONASS**.  

* Если вкратце, то скрипт даёт возможность отправляет и принимать координаты в рацию (/r).  
* Предназачен для Samp-Rp.
* Координаты могут быть обычными и динамичными:  
* Обычные координаты отправляются один раз.  
* Динамичные обновляются в чате каждые 5-15 сек.  
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

**Автор:** [qrlk (James_Bond / Phil_Coulson)](http://rubbishman.ru/samp).  
**Обсуждение в группе VK:** [ссылка](https://vk.com/topic-168860334_38597266).

# Скриншот
![https://i.imgur.com/kGt5qJi.png](https://i.imgur.com/kGt5qJi.png)  
![https://i.imgur.com/0lIM4lS.png](https://i.imgur.com/0lIM4lS.png)  
![https://i.imgur.com/3W1ARBa.png](https://i.imgur.com/3W1ARBa.png)  
![https://i.imgur.com/25KTMBQ.png](https://i.imgur.com/25KTMBQ.png)
# Видео
На видео обзор очень ранней версии, записано 19 октября. С тех пор многое было измененилось, но основные принципы понятны. Сейчас нет возможности переснять.  
[![Открыть](https://img.youtube.com/vi/OOPOaqNHHho/0.jpg)](https://www.youtube.com/watch?v=OOPOaqNHHho)
