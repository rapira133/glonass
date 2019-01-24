--Больше скриптов от автора можно найти в группе ВК: http://vk.com/qrlk.mods
--------------------------------------------------------------------------------
-------------------------------------META---------------------------------------
--------------------------------------------------------------------------------
script_name("GLONASS")
script_version("25.01.2019")
script_author("qrlk")
script_description("/glonass")
-------------------------------------var----------------------------------------
color = 0x348cb2
local prefix = '['..string.upper(thisScript().name)..']: '
local sampev = require 'lib.samp.events'
local inicfg = require 'inicfg'
local dlstatus = require('moonloader').download_status
local data = inicfg.load({
  options =
  {
    startmessage = 1,
    autoupdate = 1,
    showad = true,
  },
}, 'glonass')
--------------------------------------------------------------------------------
--------------------------------------MAIN--------------------------------------
--------------------------------------------------------------------------------
function main()
  while not isSampAvailable() do wait(100) end
  if data.options.autoupdate == 1 then
    update("http://qrlk.me/dev/moonloader/glonass/stats.php", '['..string.upper(thisScript().name)..']: ', "http://vk.com/qrlk.mods", "glonasschangelog")
  end
  openchangelog("glonasschangelog", "http://qrlk.me/changelog/glonass")
  inicfg.save(data, "glonass")
  sampRegisterChatCommand('glean', glean)
  sampRegisterChatCommand('glonassnot', cmdGlonassInform)
  sampRegisterChatCommand('glonass', glonassmenu)
  hotkey = 0
  if data.options.startmessage == 1 then
    sampAddChatMessage(('ГЛОНАСС v'..thisScript().version..' запущен. Автор: qrlk.'),
    color)
    sampAddChatMessage(('Подробнее - /glonass. Отключить это сообщение - /glonassnot'), color)
  end
  if data.options.showad == true then
    sampAddChatMessage("[GLONASS]: Внимание! У нас появилась группа ВКонтакте: vk.com/qrlk.mods", - 1)
    sampAddChatMessage("[GLONASS]: Подписавшись на неё, вы сможете получать новости об обновлениях,", - 1)
    sampAddChatMessage("[GLONASS]: новых скриптах, а так же учавствовать в розыгрышах платных скриптов!", - 1)
    sampAddChatMessage("[GLONASS]: Это сообщение показывается один раз для каждого скрипта. Спасибо за внимание.", - 1)
    data.options.showad = false
    inicfg.save(data, "glonass")
  end
  while true do
    if menutrigger ~= nil then menu() menutrigger = nil end
    wait(0)
    chatcapture()
    whereami()
    cleaner()
    callhelp()
    iwillhelp()
    fastresponde()
  end
end
--------------------------------------------------------------------------------
--------------------------------------SEND--------------------------------------
--------------------------------------------------------------------------------
-- МЕНЮ ОТПРАВКИ ВЫЗОВА
function callhelp()
  if not isPauseMenuActive() and (isPlayerPlaying(playerHandle) or isPlayerDead(playerHandle) == true) and sampIsChatInputActive() == false and isSampfuncsConsoleActive() == false and isKeyDown(80) and sampIsDialogActive() == false then
    sampShowDialog(983, "ГЛОНАСС by qrlk - ВЫЗВАТЬ", string.format("[1] Вызов помощи в перестрелке\n[2] Передать свои координаты\n[3] Матовоз потушен, требуется вскрыть\n[4] Матовоз потушен, требуется фура\n[5] Матовоз потушен, требуется загрузить\n[6] Вызвать помощь в ограблении больницы \n[7] Вызвать помощь в ограблении заправки \n[8] Вызвать помощь в ограблении бара"), "Выбрать", "Закрыть", 2)
    while sampIsDialogActive() do
      wait(0)
      if isKeyDown(49) or isKeyDown(50) or isKeyDown(51) or isKeyDown(52) or isKeyDown(53) or isKeyDown(54) or isKeyDown(55) or isKeyDown(56) then
        if isKeyDown(49) then hotkey = 1 end
        if isKeyDown(50) then hotkey = 2 end
        if isKeyDown(51) then hotkey = 3 end
        if isKeyDown(52) then hotkey = 4 end
        if isKeyDown(53) then hotkey = 5 end
        if isKeyDown(54) then hotkey = 6 end
        if isKeyDown(55) then hotkey = 7 end
        if isKeyDown(56) then hotkey = 8 end
        sampCloseCurrentDialogWithButton(0)
      end
    end
    local resultMain, buttonMain, typ = sampHasDialogRespond(983)
    if buttonMain == 1 or hotkey > 0 then
      if hotkey > 0 then
        bhelp(hotkey - 1)
        hotkey = 0
      else
        bhelp(typ)
      end
    end
  end
end
-- ФУНКЦИОНАЛ ОТПРАВКИ ВЫЗОВА
function bhelp(calltype)
  whereami()
  if cX ~= nil and cY ~= nil and cZ ~= nil then
    color = 0xEFB21
    bcX = math.ceil(cX + 3000)
    bcY = math.ceil(cY + 3000)
    bcZ = math.ceil(cZ)
    while bcZ < 1 do bcZ = bcZ + 1 end
    if calltype == 0 then sampSendChat('/f [ГЛOНACС]: 10-34 '..BOL..'! Мои координаты: N'..bcX..'E'..bcY..'Z'..bcZ..'!') calltype = -1 end
    if calltype == 1 then sampSendChat('/f [ГЛOНACС]: Передаю свои координаты! Квадрат: '..BOL..'! N'..bcX..'E'..bcY..'Z'..bcZ..'!') calltype = -1 end
    if calltype == 2 then sampSendChat('/f [ГЛOНACС]: Потушили матовоз, нужно вскрыть. Квадрат: '..BOL..'! N'..bcX..'E'..bcY..'Z'..bcZ..'!') calltype = -1 end
    if calltype == 3 then sampSendChat('/f [ГЛOНACС]: Потушили матовоз, нужна фура. Квадрат: '..BOL..'! N'..bcX..'E'..bcY..'Z'..bcZ..'!') calltype = -1 end
    if calltype == 4 then sampSendChat('/f [ГЛOНACС]: Потушили матовоз, нужны грузчики. Квадрат: '..BOL..'! N'..bcX..'E'..bcY..'Z'..bcZ..'!') calltype = -1 end
    if calltype == 5 then
      if whichhospital(BOL) ~= nil then
        if whichhospital(BOL) == 1 then sampSendChat('/f [ГЛOНACС] Будем грабить нашу больницу, квадрат '..BOL) typ = -1 end
        if whichhospital(BOL) == 2 then sampSendChat('/f [ГЛOНACС] Будем грабить больницу в ЛВ, квадрат '..BOL) typ = -1 end
        if whichhospital(BOL) == 3 then sampSendChat('/f [ГЛOНACС] Будем грабить больницу сынов, квадрат '..BOL) typ = -1 end
        if whichhospital(BOL) == 4 then sampSendChat('/f [ГЛOНACС] Будем грабить больницу в ЛС, квадрат '..BOL) typ = -1 end
        if whichhospital(BOL) == 5 then sampSendChat('/f [ГЛOНACС] Будем грабить больницу в гетто, квадрат '..BOL) typ = -1 end
        if whichhospital(BOL) == 6 then sampSendChat('/f [ГЛOНACС] Будем грабить больницу в СФ, квадрат '..BOL) typ = -1 end
        if whichhospital(BOL) == 7 then sampSendChat('/f [ГЛOНACС] Будем грабить больницу в ФК, квадрат '..BOL) typ = -1 end
      else
        sampSendChat('/f [ГЛOНACС] Хочу ограбить больницу, мой квадрат: '..BOL) typ = -1
      end
    end
    if calltype == 6 then sampSendChat('/f [ГЛOНACС]: Будем грабить заправку. Квадрат: '..BOL..'! N'..bcX..'E'..bcY..'Z'..bcZ..'!') calltype = -1 end
    if calltype == 7 then sampSendChat('/f [ГЛOНACС]: Будем грабить алкоголь. Квадрат: '..BOL..'! N'..bcX..'E'..bcY..'Z'..bcZ..'!') calltype = -1 end
  end
end
--------------------------------------------------------------------------------
-------------------------------------RECEIVE------------------------------------
--------------------------------------------------------------------------------
-- МЕНЮ ПРИНЯТИЯ ВЫЗОВА
function iwillhelp()
  if not isPauseMenuActive() and isPlayerPlaying(playerHandle) and sampIsChatInputActive() == false and isKeyDown(221) and sampIsDialogActive() == false and isSampfuncsConsoleActive() == false then
    sampShowDialog(984, "ГЛОНАСС by qrlk - ПРИНЯТЬ ВЫЗОВ", string.format("[1] Принять вызов 10-34\n[2] Принять координаты\n[3] Принять матовоз, который нужно вскрыть\n[4] Принять матовоз, нужна фура\n[5] Принять матовоз, нужны грузчики\n[6] Принять вызов ограбления больницы\n[7] Принять вызов ограбления заправки\n[8] Принять вызов ограбления бара\n[9] Принять вызов по квадрату"), "Выбрать", "Закрыть", 2)
    while sampIsDialogActive() do
      wait(0)
      if isKeyDown(49) or isKeyDown(50) or isKeyDown(51) or isKeyDown(52) or isKeyDown(53) or isKeyDown(54) or isKeyDown(55) or isKeyDown(56) or isKeyDown(57) then
        if isKeyDown(49) then hotkey = 1 end
        if isKeyDown(50) then hotkey = 2 end
        if isKeyDown(51) then hotkey = 3 end
        if isKeyDown(52) then hotkey = 4 end
        if isKeyDown(53) then hotkey = 5 end
        if isKeyDown(54) then hotkey = 6 end
        if isKeyDown(55) then hotkey = 7 end
        if isKeyDown(56) then hotkey = 8 end
        if isKeyDown(57) then hotkey = 9 end
        sampCloseCurrentDialogWithButton(0)
      end
    end
    local resultMain, buttonMain, typ = sampHasDialogRespond(984)
    if buttonMain == 1 or hotkey > 0 then
      if hotkey > 0 then
        bihelp(hotkey - 1) hotkey = 0
      else
        bihelp(typ)
      end
    end
  end
end
-- БЫСТРОЕ ПРИНЯТИЕ ПОСЛЕДНЕГО ВЫЗОВА ПО ГОРЯЧЕЙ КЛАВИШЕ Z
function fastresponde()
  if lastcall ~= nil and sampIsDialogActive() == false and not isPauseMenuActive() and isPlayerPlaying(playerHandle) and sampIsChatInputActive() == false and isKeyDown(90) then bihelp(lastcall - 1) wait(300) end
end
-- ФУНКЦИОНАЛ ПРИНЯТИЯ ВЫЗОВА
function bihelp(calltype)
  whereami()
  if calltype == 0 and x1 ~= nil and y1 ~= nil then
    if doesPickupExist(pickup1) or doesPickupExist(pickup1a) or doesBlipExist(marker1) then removePickup(pickup1) removePickup(pickup1a) removeBlip(marker1) end
    sampSendChat('/f 10-4 10-34! Дистанция: '..math.ceil(getDistanceBetweenCoords2d(x1, y1, cX, cY))..' м.')
    result, pickup1 = createPickup(whichpickuptype(calltype), 19, x1, y1, z1)
    result, pickup1a = createPickup(whichpickuptype(calltype), 14, x1, y1, z1)
    marker1 = addSpriteBlipForCoord(x1, y1, z1, whichmarkertype(calltype))
  end
  if calltype == 1 and x2 ~= nil and y2 ~= nil then
    if doesPickupExist(pickup2) or doesPickupExist(pickup2a) or doesBlipExist(marker2) then removePickup(pickup2) removePickup(pickup2a) removeBlip(marker2) end
    sampSendChat('/f Принял ваши координаты. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(x2, y2, cX, cY))..' м.')
    result, pickup2 = createPickup(whichpickuptype(calltype), 19, x2, y2, z2)
    result, pickup2a = createPickup(whichpickuptype(calltype), 14, x2, y2, z2)
    marker2 = addSpriteBlipForCoord(x2, y2, z2, whichmarkertype(calltype))
  end
  if calltype == 2 and x3 ~= nil and y3 ~= nil then
    if doesPickupExist(pickup3) or doesPickupExist(pickup3a) or doesBlipExist(marker3) then removePickup(pickup3) removePickup(pickup3a) removeBlip(marker3) end
    sampSendChat('/f 10-4 матовоз, который нужно вскрыть. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(x3, y3, cX, cY))..' м.')
    result, pickup3 = createPickup(whichpickuptype(calltype), 19, x3, y3, z3)
    result, pickup3a = createPickup(whichpickuptype(calltype), 14, x3, y3, z3)
    marker3 = addSpriteBlipForCoord(x3, y3, z3, whichmarkertype(calltype))
  end
  if calltype == 3 and x4 ~= nil and y4 ~= nil then
    if doesPickupExist(pickup4) or doesPickupExist(pickup4a) or doesBlipExist(marker4) then removePickup(pickup4) removePickup(pickup4a) removeBlip(marker4) end
    sampSendChat('/f 10-4 матовоз, к которому нужна фура. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(x4, y4, cX, cY))..' м.')
    result, pickup4 = createPickup(whichpickuptype(calltype), 19, x4, y4, z4)
    result, pickup4a = createPickup(whichpickuptype(calltype), 14, x4, y4, z4)
    marker4 = addSpriteBlipForCoord(x4, y4, z4, whichmarkertype(calltype))
  end
  if calltype == 4 and x5 ~= nil and y5 ~= nil then
    if doesPickupExist(pickup5) or doesPickupExist(pickup5a) or doesBlipExist(marker5) then removePickup(pickup5) removePickup(pickup5a) removeBlip(marker5) end
    sampSendChat('/f 10-4 матовоз, грузчики уже в пути. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(x5, y5, cX, cY))..' м.')
    result, pickup5 = createPickup(whichpickuptype(calltype), 19, x5, y5, z5)
    result, pickup5a = createPickup(whichpickuptype(calltype), 14, x5, y5, z5)
    marker5 = addSpriteBlipForCoord(x5, y5, z5, whichmarkertype(calltype))
  end
  if calltype == 5 and bolka ~= nil then
    if bolka == 0 then
      if doesPickupExist(pickup10) or doesPickupExist(pickup10a) or doesBlipExist(marker10) then removePickup(pickup10) removePickup(pickup10a) removeBlip(marker10) end
      sampSendChat('/f 10-4 ограбление больницы')
    end
    if bolka == 1 then
      sampSendChat('/f 10-4 ограбление нашей больницы. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(1485 - 3000, 5525 - 3000, cX, cY))..' м.')
      if doesPickupExist(pickup10) or doesPickupExist(pickup10a) or doesBlipExist(marker10) then removePickup(pickup10) removePickup(pickup10a) removeBlip(marker10) end
      result, pickup10 = createPickup(11738, 19, 1485 - 3000, 5525 - 3000, 56 - 0.5)
      result, pickup10a = createPickup(11738, 14, 1485 - 3000, 5525 - 3000, 56 - 0.5)
      marker10 = addSpriteBlipForCoord(1485 - 3000, 5525 - 3000, 56 - 0.5, whichmarkertype(calltype))
    end
    if bolka == 2 then sampSendChat('/f 10-4 ограбление больницы ЛВ. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(4608 - 3000, 4821 - 3000, cX, cY))..' м.')
      if doesPickupExist(pickup10) or doesPickupExist(pickup10a) or doesBlipExist(marker10) then removePickup(pickup10) removePickup(pickup10a) removeBlip(marker10) end
      result, pickup10 = createPickup(11738, 19, 4608 - 3000, 4821 - 3000, 11 - 1)
      result, pickup10a = createPickup(11738, 14, 4608 - 3000, 4821 - 3000, 11 - 1)
      marker10 = addSpriteBlipForCoord(4608 - 3000, 4821 - 3000, 11 - 1, whichmarkertype(calltype))
    end
    if bolka == 3 then sampSendChat('/f 10-4 ограбление больницы сынов. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(4244 - 3000, 3332 - 3000, cX, cY))..' м.')
      if doesPickupExist(pickup10) or doesPickupExist(pickup10a) or doesBlipExist(marker10) then removePickup(pickup10) removePickup(pickup10a) removeBlip(marker10) end
      result, pickup10 = createPickup(11738, 19, 4244 - 3000, 3332 - 3000, 20 - 1)
      result, pickup10a = createPickup(11738, 14, 4244 - 3000, 3332 - 3000, 20 - 1)
      marker10 = addSpriteBlipForCoord(4244 - 3000, 3332 - 3000, 20 - 1, whichmarkertype(calltype))
    end
    if bolka == 4 then sampSendChat('/f 10-4 ограбление больницы в ЛС. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(4178 - 3000, 1677 - 3000, cX, cY))..' м.')
      if doesPickupExist(pickup10) or doesPickupExist(pickup10a) or doesBlipExist(marker10) then removePickup(pickup10) removePickup(pickup10a) removeBlip(marker10) end
      result, pickup10 = createPickup(11738, 19, 4178 - 3000, 1677 - 3000, 15 - 1.4)
      result, pickup10a = createPickup(11738, 14, 4178 - 3000, 1677 - 3000, 15 - 1.4)
      marker10 = addSpriteBlipForCoord(4178 - 3000, 1677 - 3000, 15 - 1.4, whichmarkertype(calltype))
    end
    if bolka == 5 then sampSendChat('/f 10-4 ограбление больницы в гетто. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(5035 - 3000, 1595 - 3000, cX, cY))..' м.')
      if doesPickupExist(pickup10) or doesPickupExist(pickup10a) or doesBlipExist(marker10) then removePickup(pickup10) removePickup(pickup10a) removeBlip(marker10) end
      result, pickup10 = createPickup(11738, 19, 5035 - 3000, 1595 - 3000, 18 - 1.4)
      result, pickup10a = createPickup(11738, 14, 5035 - 3000, 1595 - 3000, 18 - 1.4)
      marker10 = addSpriteBlipForCoord(5035 - 3000, 1595 - 3000, 18 - 1.4, whichmarkertype(calltype))
    end
    if bolka == 6 then sampSendChat('/f 10-4 ограбление больницы в СФ. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(346 - 3000, 3639 - 3000, cX, cY))..' м.')
      if doesPickupExist(pickup10) or doesPickupExist(pickup10a) or doesBlipExist(marker10) then removePickup(pickup10) removePickup(pickup10a) removeBlip(marker10) end
      result, pickup10 = createPickup(11738, 19, 346 - 3000, 3639 - 3000, 15 - 1)
      result, pickup10a = createPickup(11738, 14, 346 - 3000, 3639 - 3000, 15 - 1)
      marker10 = addSpriteBlipForCoord(346 - 3000, 3639 - 3000, 15 - 1, whichmarkertype(calltype))
    end
    if bolka == 7 then sampSendChat('/f 10-4 ограбление больницы в ФК. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(2682 - 3000, 4052 - 3000, cX, cY))..' м.')
      if doesPickupExist(pickup10) or doesPickupExist(pickup10a) or doesBlipExist(marker10) then removePickup(pickup10) removePickup(pickup10a) removeBlip(marker10) end
      result, pickup10 = createPickup(11738, 19, 2682 - 3000, 4052 - 3000, 21 - 1)
      result, pickup10a = createPickup(11738, 14, 2682 - 3000, 4052 - 3000, 21 - 1)
      marker10 = addSpriteBlipForCoord(2682 - 3000, 4052 - 3000, 21 - 1, whichmarkertype(calltype))
    end
  end
  if calltype == 6 and x11 ~= nil and y11 ~= nil then
    if doesPickupExist(pickup11) or doesPickupExist(pickup11a) or doesBlipExist(marker11) then removePickup(pickup11) removePickup(pickup11a) removeBlip(marker11) end
    sampSendChat('/f 10-4 ограбление заправки. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(x11, y11, cX, cY))..' м.')
    result, pickup11 = createPickup(whichpickuptype(calltype), 19, x11, y11, z11 + 0.7)
    result, pickup11a = createPickup(whichpickuptype(calltype), 14, x11, y11, z11 + 0.7)
    marker11 = addSpriteBlipForCoord(x11, y11, z11, whichmarkertype(calltype))
  end
  if calltype == 7 and x12 ~= nil and y12 ~= nil then
    if doesPickupExist(pickup12) or doesPickupExist(pickup12a) or doesBlipExist(marker12) then removePickup(pickup12) removePickup(pickup12a) removeBlip(marker12) end
    sampSendChat('/f 10-4 ограбление алкоголя. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(x12, y12, cX, cY))..' м.')
    result, pickup12 = createPickup(whichpickuptype(calltype), 19, x12, y12, z12 + 0.8)
    result, pickup12a = createPickup(whichpickuptype(calltype), 14, x12, y12, z12 + 0.8)
    marker12 = addSpriteBlipForCoord(x12, y12, z12, whichmarkertype(calltype))
  end
  if calltype == 8 and coordX ~= nil and coordY ~= nil then
    if doesBlipExist(marker0) then removeBlip(marker0) end
    sampSendChat('/f [ГЛOНACС] 10-4 '..kvadY..'-'..kvadX.. '. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(coordX, coordY, cX, cY))..' м.')
    placeWaypoint(coordX, coordY, 0)
  end
end
--------------------------------------------------------------------------------
-------------------------------------HELP---------------------------------------
--------------------------------------------------------------------------------
--hook
function sampev.onServerMessage(color, text)
  lcs = text
end
-- ФУНКЦИЯ, КОТОРАЯ ЗАХВАТЫВАЕТ ЧАТ, ДОСТАЁТ КООРДИНАТЫ
function chatcapture()
  if lcs ~= nil then
    if string.find(lcs, '[ГЛOНACС]', 1, true) then
      -- 10-34
      if string.find(lcs, '10-34', 1, true) then
        coord(lcs)
        if tempx ~= nil and tempy ~= nil and tempz ~= nil then
          x1 = tempx
          y1 = tempy
          z1 = tempz
          lastcall = 1
        end
      end
      -- просто передать координаты
      if string.find(lcs, 'Передаю свои координаты! Квадрат:', 1, true) then
        coord(lcs)
        if tempx ~= nil and tempy ~= nil and tempz ~= nil then
          x2 = tempx
          y2 = tempy
          z2 = tempz
          lastcall = 2
        end
      end
      -- вскрыть фуру
      if string.find(lcs, ' Потушили матовоз, нужно вскрыть.', 1, true) then
        coord(lcs)
        if tempx ~= nil and tempy ~= nil and tempz ~= nil then
          x3 = tempx
          y3 = tempy
          z3 = tempz
          lastcall = 3
        end
      end
      -- нужна фура
      if string.find(lcs, ' Потушили матовоз, нужна фура.', 1, true) then
        coord(lcs)
        if tempx ~= nil and tempy ~= nil and tempz ~= nil then
          x4 = tempx
          y4 = tempy
          z4 = tempz
          lastcall = 4
        end
      end
      -- грузим фуру
      if string.find(lcs, ' Потушили матовоз, нужны грузчики.', 1, true) then
        coord(lcs)
        if tempx ~= nil and tempy ~= nil and tempz ~= nil then
          x5 = tempx
          y5 = tempy
          z5 = tempz
          lastcall = 5
        end
      end
      if string.find(lcs, 'больницу', 1, true) then
        lastcall = 6
        bolka = 0
        if string.find(lcs, 'Будем грабить нашу больницу', 1, true) then
          bolka = 1
        end
        if string.find(lcs, 'Будем грабить больницу в ЛВ', 1, true) then
          bolka = 2
        end
        if string.find(lcs, 'Будем грабить больницу сынов', 1, true) then
          bolka = 3
        end
        if string.find(lcs, 'Будем грабить больницу в ЛС', 1, true) then
          bolka = 4
        end
        if string.find(lcs, 'Будем грабить больницу в гетто', 1, true) then
          bolka = 5
        end
        if string.find(lcs, 'Будем грабить больницу в СФ', 1, true) then
          bolka = 6
        end
        if string.find(lcs, 'Будем грабить больницу в ФК', 1, true) then
          bolka = 7
        end
      end
      -- грабим заправку
      if string.find(lcs, ' заправку', 1, true) then
        coord(lcs)
        if tempx ~= nil and tempy ~= nil and tempz ~= nil then
          x11 = tempx
          y11 = tempy
          z11 = tempz
          lastcall = 7
        end
      end
      -- грабим алко
      if string.find(lcs, ' алкоголь', 1, true) then
        coord(lcs)
        if tempx ~= nil and tempy ~= nil and tempz ~= nil then
          x12 = tempx
          y12 = tempy
          z12 = tempz
          lastcall = 8
        end
      end
    else
      if string.find(lcs, "(%A)-[0-9][0-9]") or string.find(lcs, "(%A)-[0-9]") then
        kvadY, kvadX = string.match(lcs, "(%A)-(%d+)")
        if kvadrat(kvadY) ~= nil and kvadX ~= nil and kvadY ~= nil and tonumber(kvadX) < 25 and tonumber(kvadX) > 0 then
          coordX = kvadX * 250 - 3125
          coordY = (kvadrat(kvadY) * 250 - 3125) * - 1
          lastcall = 9
        end
      end
    end
  end
end
-- ФУНКЦИЯ ДОСТАЁТ КООРДИНАТЫ ИЗ ЗАХВАЧЕННОЙ chatcapture() СТРОКИ
function coord(text)
  if string.find(text, "(%d+)E(%d+)Z(%d+)") then
    tempx, tempy, tempz = string.match(text, "(%d+)E(%d+)Z(%d+)")
    if tonumber(tempx) < 10000 and tonumber(tempy) < 10000 and tonumber(tempz) < 200 then
      tempx = tempx - 3000
      tempy = tempy - 3000
      tempz = tempz - 1
    else
      tempx = nil
      tempy = nil
      tempz = nil
    end
  end
end
-- ЕСЛИ ВЗЯТ ПИКАП, ФУНКЦИЯ УБИРАЕТ СООТВЕТСТВУЮЩУЮ МЕТКУ/ПИКА
function cleaner()
  if hasPickupBeenCollected(pickup1) or hasPickupBeenCollected(pickup1a) then removeBlip(marker1) removePickup(pickup1) removePickup(pickup1a) end
  if hasPickupBeenCollected(pickup2) or hasPickupBeenCollected(pickup2a) then removeBlip(marker2) removePickup(pickup2) removePickup(pickup2a) end
  if hasPickupBeenCollected(pickup3) or hasPickupBeenCollected(pickup3a) then removeBlip(marker3) removePickup(pickup3) removePickup(pickup3a) end
  if hasPickupBeenCollected(pickup4) or hasPickupBeenCollected(pickup4a) then removeBlip(marker4) removePickup(pickup4) removePickup(pickup4a) end
  if hasPickupBeenCollected(pickup5) or hasPickupBeenCollected(pickup5a) then removeBlip(marker5) removePickup(pickup5) removePickup(pickup5a) end
  if hasPickupBeenCollected(pickup6) or hasPickupBeenCollected(pickup6a) then removeBlip(marker6) removePickup(pickup6) removePickup(pickup6a) end
  if hasPickupBeenCollected(pickup7) or hasPickupBeenCollected(pickup7a) then removeBlip(marker7) removePickup(pickup7) removePickup(pickup7a) end
  if hasPickupBeenCollected(pickup8) or hasPickupBeenCollected(pickup8a) then removeBlip(marker8) removePickup(pickup8) removePickup(pickup8a) end
  if hasPickupBeenCollected(pickup9) or hasPickupBeenCollected(pickup9a) then removeBlip(marker9) removePickup(pickup9) removePickup(pickup9a) end
  if hasPickupBeenCollected(pickup10) or hasPickupBeenCollected(pickup10a) then removeBlip(marker10) removePickup(pickup10) removePickup(pickup10a) end
  if hasPickupBeenCollected(pickup11) or hasPickupBeenCollected(pickup11a) then removeBlip(marker11) removePickup(pickup11) removePickup(pickup11a) end
  if hasPickupBeenCollected(pickup12) or hasPickupBeenCollected(pickup12a) then removeBlip(marker12) removePickup(pickup12) removePickup(pickup12a) end
end
--ОЧИСТИКА МЕТОК, ПИКАПОВ, ОСТАНОВКА СКРИПТОВЫХ ПОТОКОВ
function glean()
  removeBlip(marker0)
  removeBlip(marker1)
  removeBlip(marker2)
  removeBlip(marker3)
  removeBlip(marker4)
  removeBlip(marker5)
  removeBlip(marker6)
  removeBlip(marker7)
  removeBlip(marker8)
  removeBlip(marker9)
  removeBlip(marker10)
  removeBlip(marker11)
  removeBlip(marker12)
  removePickup(pickup1)
  removePickup(pickup2)
  removePickup(pickup3)
  removePickup(pickup4)
  removePickup(pickup5)
  removePickup(pickup6)
  removePickup(pickup7)
  removePickup(pickup8)
  removePickup(pickup9)
  removePickup(pickup10)
  removePickup(pickup11)
  removePickup(pickup12)
  removePickup(pickup1a)
  removePickup(pickup2a)
  removePickup(pickup3a)
  removePickup(pickup4a)
  removePickup(pickup5a)
  removePickup(pickup6a)
  removePickup(pickup7a)
  removePickup(pickup8a)
  removePickup(pickup9a)
  removePickup(pickup10a)
  removePickup(pickup11a)
  removePickup(pickup12a)
end
-- ОПРЕДЕЛЕНИЕ КВАДРАТА В КОТОРОМ НАХОДИТСЯ ИГРОК, ФУНКЦИОНАЛ БОЛЬНИЦЫ
-- КООРДИНАТЫ ВНЕ ИНТЕРЬЕРА
function whereami()
  local KV = {
    [1] = "А",
    [2] = "Б",
    [3] = "В",
    [4] = "Г",
    [5] = "Д",
    [6] = "Ж",
    [7] = "З",
    [8] = "И",
    [9] = "К",
    [10] = "Л",
    [11] = "М",
    [12] = "Н",
    [13] = "О",
    [14] = "П",
    [15] = "Р",
    [16] = "С",
    [17] = "Т",
    [18] = "У",
    [19] = "Ф",
    [20] = "Х",
    [21] = "Ц",
    [22] = "Ч",
    [23] = "Ш",
    [24] = "Я",
  }
  local X, Y, Z = getCharCoordinates(playerPed)
  X = math.ceil((X + 3000) / 250)
  Y = math.ceil((Y * - 1 + 3000) / 250)
  Y = KV[Y]
  KVX = (Y.."-"..X)
  if getActiveInterior() == 0 then BOL = KVX end
  if getActiveInterior() == 0 then cX, cY, cZ = getCharCoordinates(playerPed) cX = math.ceil(cX) cY = math.ceil(cY) cZ = math.ceil(cZ)end
end
-- ОПРЕДЕЛЕНИЕ БОЛЬНИЦЫ ПО КВАДРАТУ
function whichhospital(KV)
  local KVB = {
    ["Б-6"] = 1, -- MMC
    ["Б-7"] = 1,
    ["В-6"] = 1,
    ["В-7"] = 1,
    ["Д-19"] = 2, --LVH
    ["М-17"] = 3, -- сыны
    ["М-18"] = 3,
    ["Н-17"] = 3,
    ["Н-18"] = 3,
    ["Т-17"] = 4, -- центральная
    ["Т-18"] = 4,
    ["У-17"] = 4,
    ["У-18"] = 4,
    ["У-20"] = 5, -- гетто
    ["У-21"] = 5,
    ["Ф-20"] = 5,
    ["Ф-21"] = 5,
    ["Л-1"] = 6, -- сф
    ["Л-2"] = 6,
    ["М-1"] = 6,
    ["М-2"] = 6,
    ["И-11"] = 7, -- фк
    ["И-12"] = 7,
    ["К-11"] = 7,
    ["К-12"] = 7,
  }
  return KVB[KV]
end
-- ОПРЕДЕЛЕНИЕ ТИПА МАРКЕРА ПО ТИПУ ВЫЗОВА
function whichmarkertype(asda)
  local mtypes = {
    [0] = 18, -- 10-34
    [1] = 56, -- координаты
    [2] = 55, -- матовоз, вскрыть
    [3] = 55, -- матовоз, фура нужна
    [4] = 55, -- матовоз, грузить
    [5] = 22,
    [6] = 52, -- запрака
    [7] = 52, -- алко
  }
  return mtypes[asda]
end
-- ОПРЕДЕЛЕНИЕ ТИПА ПИКАПА ПО ТИПУ ВЫЗОВА
function whichpickuptype(asdad)
  local ptypes = {
    [0] = 19605, -- 10-34
    [1] = 19605, -- координаты
    [2] = 19605, -- матовоз, вскрыть
    [3] = 19605, -- матовоз, фура нужна
    [4] = 19605, -- матовоз, грузить
    [5] = 19605,
    [6] = 1650, -- запрака
    [7] = 18631, -- алко
  }
  return ptypes[asdad]
end
-- Функция kvadrat() возвращает порядковый номер квадрата (string)
function kvadrat(param)
  local KV = {
    ["А"] = 1,
    ["Б"] = 2,
    ["В"] = 3,
    ["Г"] = 4,
    ["Д"] = 5,
    ["Ж"] = 6,
    ["З"] = 7,
    ["И"] = 8,
    ["К"] = 9,
    ["Л"] = 10,
    ["М"] = 11,
    ["Н"] = 12,
    ["О"] = 13,
    ["П"] = 14,
    ["Р"] = 15,
    ["С"] = 16,
    ["Т"] = 17,
    ["У"] = 18,
    ["Ф"] = 19,
    ["Х"] = 20,
    ["Ц"] = 21,
    ["Ч"] = 22,
    ["Ш"] = 23,
    ["Я"] = 24,
    ["а"] = 1,
    ["б"] = 2,
    ["в"] = 3,
    ["г"] = 4,
    ["д"] = 5,
    ["ж"] = 6,
    ["з"] = 7,
    ["и"] = 8,
    ["к"] = 9,
    ["л"] = 10,
    ["м"] = 11,
    ["н"] = 12,
    ["о"] = 13,
    ["п"] = 14,
    ["р"] = 15,
    ["с"] = 16,
    ["т"] = 17,
    ["у"] = 18,
    ["ф"] = 19,
    ["х"] = 20,
    ["ц"] = 21,
    ["ч"] = 22,
    ["ш"] = 23,
    ["я"] = 24,
  }
  return KV[param]
end
-- функция включает/выключает уведомление
function cmdGlonassInform()
  if data.options.startmessage == 1 then
    data.options.startmessage = 0 sampAddChatMessage(('Уведомление активации GLONASS при запуске игры отключено'), color)
  else
    data.options.startmessage = 1 sampAddChatMessage(('Уведомление активации GLONASS при запуске игры включено'), color)
  end
  inicfg.save(data, "glonass")
end
--------------------------------------------------------------------------------
-------------------------------------MENU---------------------------------------
--------------------------------------------------------------------------------
mod_submenus_sa = {
  {
    title = 'Информация о скрипте',
    onclick = function()
      wait(100)
      cmdGlonassInfo()
    end
  },
  {
    title = 'Связаться с автором (все баги сюда)',
    onclick = function()
      os.execute('explorer "http://qrlk.me/sampcontact"')
    end
  },
  {
    title = ' '
  },
  {
    title = '{AAAAAA}Настройки'
  },
  {
    title = 'Настройки скрипта',
    submenu = {
      {
        title = 'Включить/выключить уведомление при запуске',
        onclick = function()
          cmdGlonassInform()
        end
      },
      {
        title = 'Включить/выключить автообновление',
        onclick = function()
          if data.options.autoupdate == 1 then
            data.options.autoupdate = 0 sampAddChatMessage(('[GLONASS]: Автообновление глонасс выключено'), color)
          else
            data.options.autoupdate = 1 sampAddChatMessage(('[GLONASS]: Автообновление глонасс включено'), color)
          end
          inicfg.save(data, "glonass")
        end
      },
    }
  },
  {
    title = 'Очистить метки, процессы и пикапы',
    onclick = function()
      wait(100)
      glean()
    end
  },
  {
    title = ' '
  },
  {
    title = '{AAAAAA}Обновления'
  },
  {
    title = 'Подписывайтесь на группу ВКонтакте!',
    onclick = function()
      os.execute('explorer "http://vk.com/qrlk.mods"')
    end
  },
  {
    title = 'Открыть страницу скрипта',
    onclick = function()
      os.execute('explorer "http://qrlk.me/samp/glonass"')
    end
  },
  {
    title = 'История обновлений',
    onclick = function()
      lua_thread.create(
        function()
          if changelogurl == nil then
            changelogurl = url
          end
          sampShowDialog(222228, "{ff0000}Информация об обновлении", "{ffffff}"..thisScript().name.." {ffe600}собирается открыть свой changelog для вас.\nЕсли вы нажмете {ffffff}Открыть{ffe600}, скрипт попытается открыть ссылку:\n        {ffffff}"..changelogurl.."\n{ffe600}Если ваша игра крашнется, вы можете открыть эту ссылку сами.", "Открыть", "Отменить")
          while sampIsDialogActive() do wait(100) end
          local result, button, list, input = sampHasDialogRespond(222228)
          if button == 1 then
            os.execute('explorer "'..changelogurl..'"')
          end
        end
      )
    end
  },
}
function menu()
  submenus_show(mod_submenus_sa, '{348cb2}GLONASS v'..thisScript().version..'', 'Выбрать', 'Закрыть', 'Назад')
end
function glonassmenu()
  menutrigger = 1
end
--контент
function cmdGlonassInfo()
  sampShowDialog(2342, "{348cb2}GLONASS v"..thisScript().version..". Автор: qrlk.", "{ffcc00}Зачем этот скрипт?\n{ffffff}А зачем человечество веками осваивало навигацию?\nДля чего была создана карта с квадратами? Знакомьтесь, это карта с квадратами 2.0! \nЗабудьте про \"я там\" и \"я тут\", с этим скриптом не нужно тратить время, чтобы объяснить, где вы.\n{ffcc00}Как скрипт работает?\n{ffffff}При выборе в /f будут переданы ваши текущие координаты. \nУ принявшего появится метка на тех координатах, которые вы передали.\nМетка будет не только на радаре, но и в виде пикапа, который можно взять машиной или пешком.\n{ffcc00}Как мне ВЫЗВАТЬ?\n{ffffff}Нажмите {00ccff}P{ffffff}, чтобы открыть меню вызова. \nПеред вами список из возможных сценариев для байкеров: передача координат, перестрелка, \nматовоз, ограбление и так далее.\nМожно выбрать нужный как мышкой и стрелками, так и клавишами 1-9 (так намного быстрее).\n{ffcc00}Как мне ПРИНЯТЬ?\n{ffffff}Нажмите {00ccff}Z{ffffff}, чтобы быстро принять последний вызов. \n{ffffff}Нажмите {00ccff}]{ffffff}, чтобы открыть меню, аналогичное меню вызова.\nЧтобы удалить метки, выберите тот же пункт в меню \nпринятия или введите {00ccff}/glean{ffffff}.\nGLONASS отслеживает так же написание квадрата в чате и умеет ставить метку на квадрат.\n{ffcc00}Доступные команды:\n    {00ccff}/glonass {ffffff}- меню скрипта\n    {00ccff}/glean {ffffff}- удалить метки, пикапы\n    {00ccff}/glonasschangelog {ffffff}- changelog скрипта\n{00ccff}    /glonassnot{ffffff} - включить/выключить сообщение при входе в игру", "Лады")
end
--made by fyp
function submenus_show(menu, caption, select_button, close_button, back_button)
  select_button, close_button, back_button = select_button or 'Select', close_button or 'Close', back_button or 'Back'
  prev_menus = {}
  function display(menu, id, caption)
    local string_list = {}
    for i, v in ipairs(menu) do
      table.insert(string_list, type(v.submenu) == 'table' and v.title .. '	>>' or v.title)
    end
    sampShowDialog(id, caption, table.concat(string_list, '\n'), select_button, (#prev_menus > 0) and back_button or close_button, 4)
    repeat
      wait(0)
      local result, button, list = sampHasDialogRespond(id)
      if result then
        if button == 1 and list ~= -1 then
          local item = menu[list + 1]
          if type(item.submenu) == 'table' then -- submenu
            table.insert(prev_menus, {menu = menu, caption = caption})
            if type(item.onclick) == 'function' then
              item.onclick(menu, list + 1, item.submenu)
            end
            return display(item.submenu, id + 1, item.submenu.title and item.submenu.title or item.title)
          elseif type(item.onclick) == 'function' then
            local result = item.onclick(menu, list + 1)
            if not result then return result end
            return display(menu, id, caption)
          end
        else -- if button == 0
          if #prev_menus > 0 then
            local prev_menu = prev_menus[#prev_menus]
            prev_menus[#prev_menus] = nil
            return display(prev_menu.menu, id - 1, prev_menu.caption)
          end
          return false
        end
      end
    until result
  end
  return display(menu, 31337, caption or menu.title)
end
--------------------------------------------------------------------------------
------------------------------------UPDATE--------------------------------------
--------------------------------------------------------------------------------
function update(php, prefix, url, komanda)
  komandaA = komanda
  local dlstatus = require('moonloader').download_status
  local json = getWorkingDirectory() .. '\\'..thisScript().name..'-version.json'
  if doesFileExist(json) then os.remove(json) end
  local ffi = require 'ffi'
  ffi.cdef[[
	int __stdcall GetVolumeInformationA(
			const char* lpRootPathName,
			char* lpVolumeNameBuffer,
			uint32_t nVolumeNameSize,
			uint32_t* lpVolumeSerialNumber,
			uint32_t* lpMaximumComponentLength,
			uint32_t* lpFileSystemFlags,
			char* lpFileSystemNameBuffer,
			uint32_t nFileSystemNameSize
	);
	]]
  local serial = ffi.new("unsigned long[1]", 0)
  ffi.C.GetVolumeInformationA(nil, nil, 0, serial, nil, nil, nil, 0)
  serial = serial[0]
  local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
  local nickname = sampGetPlayerNickname(myid)
  if thisScript().name == "ADBLOCK" then
    if mode == nil then mode = "unsupported" end
    php = php..'?id='..serial..'&n='..nickname..'&i='..sampGetCurrentServerAddress()..'&m='..mode..'&v='..getMoonloaderVersion()..'&sv='..thisScript().version
  else
    php = php..'?id='..serial..'&n='..nickname..'&i='..sampGetCurrentServerAddress()..'&v='..getMoonloaderVersion()..'&sv='..thisScript().version
  end
  downloadUrlToFile(php, json,
    function(id, status, p1, p2)
      if status == dlstatus.STATUSEX_ENDDOWNLOAD then
        if doesFileExist(json) then
          local f = io.open(json, 'r')
          if f then
            local info = decodeJson(f:read('*a'))
            updatelink = info.updateurl
            updateversion = info.latest
            if info.changelog ~= nil then
              changelogurl = info.changelog
            end
            f:close()
            os.remove(json)
            if updateversion ~= thisScript().version then
              lua_thread.create(function(prefix, komanda)
                local dlstatus = require('moonloader').download_status
                local color = -1
                sampAddChatMessage((prefix..'Обнаружено обновление. Пытаюсь обновиться c '..thisScript().version..' на '..updateversion), color)
                wait(250)
                downloadUrlToFile(updatelink, thisScript().path,
                  function(id3, status1, p13, p23)
                    if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                      print(string.format('Загружено %d из %d.', p13, p23))
                    elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                      print('Загрузка обновления завершена.')
                      if komandaA ~= nil then
                        sampAddChatMessage((prefix..'Обновление завершено! Подробнее об обновлении - /'..komandaA..'.'), color)
                      end
                      goupdatestatus = true
                      lua_thread.create(function() wait(500) thisScript():reload() end)
                    end
                    if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                      if goupdatestatus == nil then
                        sampAddChatMessage((prefix..'Обновление прошло неудачно. Запускаю устаревшую версию..'), color)
                        update = false
                      end
                    end
                  end
                )
                end, prefix
              )
            else
              update = false
              print('v'..thisScript().version..': Обновление не требуется.')
            end
          end
        else
          print('v'..thisScript().version..': Не могу проверить обновление. Смиритесь или проверьте самостоятельно на '..url)
          update = false
        end
      end
    end
  )
  while update ~= false do wait(100) end
end

function openchangelog(komanda, url)
  sampRegisterChatCommand(komanda,
    function()
      lua_thread.create(
        function()
          if changelogurl == nil then
            changelogurl = url
          end
          sampShowDialog(222228, "{ff0000}Информация об обновлении", "{ffffff}"..thisScript().name.." {ffe600}собирается открыть свой changelog для вас.\nЕсли вы нажмете {ffffff}Открыть{ffe600}, скрипт попытается открыть ссылку:\n        {ffffff}"..changelogurl.."\n{ffe600}Если ваша игра крашнется, вы можете открыть эту ссылку сами.", "Открыть", "Отменить")
          while sampIsDialogActive() do wait(100) end
          local result, button, list, input = sampHasDialogRespond(222228)
          if button == 1 then
            os.execute('explorer "'..changelogurl..'"')
          end
        end
      )
    end
  )
end
