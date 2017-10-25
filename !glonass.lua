script_name("GLONASS")

script_version("0.13")
script_author("j.b.")

function main()
	while not isSampAvailable() do wait(10) end
	nick = sampGetPlayerNickname(0)
	sampRegisterChatCommand('glean', glean)
	hotkey = 0
	folme = lua_thread.create_suspended(followme)
	ifolu5 = lua_thread.create_suspended(ifolu5)
	ifolu6 = lua_thread.create_suspended(ifolu6)
	ifolu7 = lua_thread.create_suspended(ifolu7)
	ifolu8 = lua_thread.create_suspended(ifolu8)
	folme:terminate()
	ifolu5:terminate()
	ifolu6:terminate()
	ifolu7:terminate()
	ifolu8:terminate()
	font = renderCreateFont("Segoe UI", 9, 5);
	local names = {
		["James_Bond"] = "friend",
		["Kabina_Dragonsoft"] = "friend",
		["Francesco_Garsia"] = "friend",
		["Andrew_Soprano"] = "friend",
		["Vittore_Deltoro"] = "friend",
		["Riley_Reid"] = "friend",
		["Alan_Morgan"] = "friend",
		["Chester_Phillips"] = "friend",
		["Mike_Rein"] = "friend",
		["Alex_Rein"] = "friend",
		["Christopher_Star"] = "friend",
		["Alejandro_Sauce"] = "friend",
	}
	--if sampGetCurrentServerAddress() == '185.169.134.11' --and names[nick] == "friend" then
	if sampGetCurrentServerAddress() == '185.169.134.11'then
		sampAddChatMessage(('ГЛОНАСС инициализирован. Автор: James_Bond/rubbishman/Coulson.'),
		0xEFBFB)
		sampAddChatMessage(('Нубопроверка лицензии пройдена. Скрипт написан монголом для монголов. MFFM.'),
		0xEFBFB)
		sampAddChatMessage(('Лицензия принадлежит: '..nick),
		0xEFBFB)
		while true do
			fsdfds, currentveh = sampGetVehicleIdByCarHandle(storeCarCharIsInNoSave(PLAYER_PED))
			fura()
			wait(0)
			chatcapture()
			whereami()
			cleaner()
			callhelp()
			iwillhelp()
			fastresponde()
		end
	else
		sampAddChatMessage(('ГЛОНАСС отключён. Проверка лицензии не пройдена.'), 0xEFBFB)
	end
end
function fura()
	resulfura, handlefura = sampGetCarHandleBySampVehicleId(360) --112
	veh = storeCarCharIsInNoSave(PLAYER_PED)
	if veh == handlefura then
		if doesBlipExist(furablip1) == true then removeBlip(furablip1) end
	else
		if resulfura == true then
			if doesBlipExist(furablip1) == false then furablip1 = addBlipForCar (handlefura)
				changeBlipColour(furablip1, 0xDEB887)
			end
		end
	end
end
function coord(text)
	tempx, tempy, tempz = string.match(text, "(%d+)E(%d+)Z(%d+)")
	tempx = tempx - 3000
	tempy = tempy - 3000
	tempz = tempz - 1
end
-- если взят пикап, убирает маркер
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
--очистка и перезапуск
function glean()
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
	folme:terminate()
	ifolu5:terminate()
	ifolu6:terminate()
	ifolu7:terminate()
	ifolu8:terminate()
end
function debug()
	while true do
		wait(100)
		if x6 ~= nil and x6b ~= nil then
			renderFontDrawText(font, HP.." x6: "..x6.." y6: "..y6, 55, 279, - 1)
			renderFontDrawText(font, HP.." x6b: "..x6b.." y6b: "..y6b, 55, 300, - 1)
			HP = HP + 1
		end
	end
end
-- хук чата
function chatcapture()
	lcs, prefix, color, pcolor = sampGetChatString(99)
	if string.find(lcs, '[ГЛOНACС]', 1, true) then
		-- 10-34
		if string.find(lcs, '10-34', 1, true) then
			coord(lcs)
			x1 = tempx
			y1 = tempy
			z1 = tempz
			lastcall = 1
		end
		-- просто передать координаты
		if string.find(lcs, 'Передаю свои координаты! Квадрат:', 1, true) then
			coord(lcs)
			x2 = tempx
			y2 = tempy
			z2 = tempz
			lastcall = 2
		end
		-- вскрыть фуру
		if string.find(lcs, ' Потушили матовоз, нужно вскрыть.', 1, true) then
			coord(lcs)
			x3 = tempx
			y3 = tempy
			z3 = tempz
			lastcall = 3
		end
		-- нужна фура
		if string.find(lcs, ' Потушили матовоз, нужна фура.', 1, true) then
			coord(lcs)
			x4 = tempx
			y4 = tempy
			z4 = tempz
			lastcall = 4
		end
		-- грузим фуру
		if string.find(lcs, ' Потушили матовоз, нужны грузчики.', 1, true) then
			coord(lcs)
			x5 = tempx
			y5 = tempy
			z5 = tempz
			lastcall = 5
		end
		if string.find(lcs, ' Следуйте за мной!', 1, true) then
			coord(lcs)
			x6 = tempx
			y6 = tempy
			z6 = tempz
			lastcall = 6
		end
		if string.find(lcs, ' FOLLOW!', 1, true) then
			coord(lcs)
			x6 = tempx
			y6 = tempy
			z6 = tempz
			lastcall = 6
		end
		if string.find(lcs, ' Погоня! Я охотник.', 1, true) then
			coord(lcs)
			x7 = tempx
			y7 = tempy
			z7 = tempz
			lastcall = 7
		end
		if string.find(lcs, ' Режим OXOTHIK!', 1, true) then
			coord(lcs)
			x7 = tempx
			y7 = tempy
			z7 = tempz
			lastcall = 7
		end
		if string.find(lcs, ' Погоня! Я жертва. ', 1, true) then
			coord(lcs)
			x8 = tempx
			sampAddChatMessage('ss')
			y8 = tempy
			z8 = tempz
			lastcall = 8
		end
		if string.find(lcs, ' Режим JERTVA!', 1, true) then
			coord(lcs)
			x8 = tempx
			y8 = tempy
			z8 = tempz
			lastcall = 8
		end
		if string.find(lcs, ' Везу фуру. Квадрат:', 1, true) then
			coord(lcs)
			x9 = tempx
			y9 = tempy
			z9 = tempz
			lastcall = 9
		end
		if string.find(lcs, 'Координаты фуры: ', 1, true) then
			coord(lcs)
			x9 = tempx
			y9 = tempy
			z9 = tempz
			lastcall = 9
		end
		if string.find(lcs, 'больницу', 1, true) then
			lastcall = 10
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
			x11 = tempx
			y11 = tempy
			z11 = tempz
			lastcall = 11
		end
		-- грабим алко
		if string.find(lcs, ' алкоголь', 1, true) then
			coord(lcs)
			x12 = tempx
			y12 = tempy
			z12 = tempz
			lastcall = 12
		end
	end
end

function followme(typ)
	while true do
		wait(1)
		whereami()
		wait(math.random(3000, 7000))
		fcX = math.ceil(cX + 3000)
		fcY = math.ceil(cY + 3000)
		fcZ = math.ceil(cZ)
		if typ == 5 then sampSendChat('/f [ГЛOНACС]: Режим FOLLOW! Квадрат: '..BOL..'! N'..fcX..'E'..fcY..'Z'..fcZ..'!') end
		if typ == 6 then sampSendChat('/f [ГЛOНACС]: Режим OXOTHIK! Квадрат: '..BOL..'! N'..fcX..'E'..fcY..'Z'..fcZ..'!') end
		if typ == 7 then sampSendChat('/f [ГЛOНACС]: Режим JERTVA! Квадрат: '..BOL..'! N'..fcX..'E'..fcY..'Z'..fcZ..'!') end
		if typ == 8 and currentveh == 360 then sampSendChat('/f [ГЛOНACС]: Координаты фуры: '..BOL..'! N'..fcX..'E'..fcY..'Z'..fcZ..'!') end
	end
end

function ifolu5()
	if5 = 5
	x6b = 0
	y6b = 0
	while true do
		wait(50)
		if x6b ~= x6 or y6b ~= y6 then
			x6b = x6
			y6b = y6
			if doesPickupExist(pickup6) or doesPickupExist(pickup6a) or doesBlipExist(marker6) then removePickup(pickup6) removePickup(pickup6a) removeBlip(marker6) end
			result, pickup6 = createPickup(whichpickuptype(if5), 19, x6, y6, z6)
			result, pickup6a = createPickup(whichpickuptype(if5), 14, x6, y6, z6)
			marker6 = addSpriteBlipForCoord(x6, y6, z6, whichmarkertype(if5))
		end
	end
end

function ifolu6()
	if6 = 6
	x7b = 0
	y7b = 0
	while true do
		wait(100)
		if x7b ~= x7 or y7b ~= y7 then
			x7b = x7
			y7b = y7
			if doesPickupExist(pickup7) or doesPickupExist(pickup7a) or doesBlipExist(marker7) then removePickup(pickup7) removePickup(pickup7a) removeBlip(marker7) end
			result, pickup7 = createPickup(whichpickuptype(if6), 19, x7, y7, z7)
			result, pickup7a = createPickup(whichpickuptype(if6), 14, x7, y7, z7)
			marker7 = addSpriteBlipForCoord(x7, y7, z7, whichmarkertype(if6))
		end
	end
end

function ifolu7()
	if7 = 7
	x8b = 0
	y8b = 0
	while true do
		wait(100)
		if x8b ~= x8 or y8b ~= y8 then
			x8b = x8
			y8b = y8
			if doesPickupExist(pickup8) or doesPickupExist(pickup8a) or doesBlipExist(marker8) then removePickup(pickup8) removePickup(pickup8a) removeBlip(marker8) end
			result, pickup8 = createPickup(whichpickuptype(if7), 19, x8, y8, z8)
			result, pickup8a = createPickup(whichpickuptype(if7), 14, x8, y8, z8)
			marker8 = addSpriteBlipForCoord(x8, y8, z8, whichmarkertype(if7))
		end
	end
end

function ifolu8()
	if8 = 8
	x9b = 0
	y9b = 0
	while true do
		wait(100)
		if x9b ~= x9 or y9b ~= y9 then
			x9b = x9
			y9b = y9
			if doesPickupExist(pickup9) or doesPickupExist(pickup9a) or doesBlipExist(marker9) then removePickup(pickup9) removePickup(pickup9a) removeBlip(marker9) end
			result, pickup9 = createPickup(whichpickuptype(if8), 19, x9, y9, z9)
			result, pickup9a = createPickup(whichpickuptype(if8), 14, x9, y9, z9)
			marker9 = addSpriteBlipForCoord(x9, y9, z9, whichmarkertype(if8))
		end
	end
end

function callhelp()
	if not isPauseMenuActive() and isPlayerPlaying(playerHandle) and sampIsChatInputActive() == false and isKeyDown(219) then
		sampShowDialog(983, "ГЛОНАСС by rubbishman - ВЫЗВАТЬ", string.format("[1] Вызов помощи в перестрелке (статичная метка)\n[2] Передать свои координаты (статичная метка)\n[3] Матовоз потушен, требуется вскрыть (статичная метка)\n[4] Матовоз потушен, требуется фура (статичная метка)\n[5] Матовоз потушен, требуется загрузить (статичная метка)\n[6] Следуйте за мной (динамичная метка)\n[7] Вызов помощь в погоне, охотник (динамичная метка)\n[8] Вызов помощь в погоне, жертва (динамичная метка)\n[9] Везу фуру (динамичная метка, только в фуре)\n[10] Вызвать помощь в ограблении больницы \n[11] Вызвать помощь в ограблении заправки (статичная метка)\n[12] Вызвать помощь в ограблении бара (статичная метка)"), "Выбрать", "Закрыть", 2)
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
				if isKeyDown(58) then hotkey = 10 end
				sampCloseCurrentDialogWithButton(0)
			end
		end
		local resultMain, buttonMain, typ = sampHasDialogRespond(983)
		if buttonMain == 1 or hotkey > 0 then
			if hotkey > 0 then
				bhelp(hotkey - 1) hotkey = 0
			else
				bhelp(typ)
			end
		end
	end
end

function iwillhelp()
	if not isPauseMenuActive() and isPlayerPlaying(playerHandle) and sampIsChatInputActive() == false and isKeyDown(221) then
		sampShowDialog(984, "ГЛОНАСС by rubbishman - ПРИНЯТЬ ВЫЗОВ", string.format("[1] Принять вызов 10-34\n[2] Принять координаты\n[3] Принять матовоз, который нужно вскрыть\n[4] Принять матовоз, нужна фура\n[5] Принять матовоз, нужны грузчики\n[6] Принять \"Следуйте за мной\" (динамическая)\n[7] Принять вызов помощи в погоне, охотник (динамическая)\n[8] Принять вызов помощи в погоне, жертва (динамичная)\n[9] Отслеживать координаты фуры (динамичная)\n[10] Принять вызов ограбления больницы\n[11] Принять вызов ограбления заправки\n[12] Принять вызов ограбления бара"), "Выбрать", "Закрыть", 2)
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
				if isKeyDown(58) then hotkey = 10 end
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

function fastresponde()
	if lastcall ~= nil and not isPauseMenuActive() and isPlayerPlaying(playerHandle) and sampIsChatInputActive() == false and isKeyDown(90) then bihelp(lastcall - 1) wait(300) end
end

function bhelp(calltype)
	whereami()
	if cX ~= nil and cY ~= nil and cZ ~= nil then
		color = 0xEFB21
		bcX = math.ceil(cX + 3000)
		bcY = math.ceil(cY + 3000)
		bcZ = math.ceil(cZ)
		if calltype == 0 then sampSendChat('/f [ГЛOНACС]: 10-34 '..BOL..'! Мои координаты: N'..cX..'E'..cY..'Z'..cZ..'!') calltype = -1 end
		if calltype == 1 then sampSendChat('/f [ГЛOНACС]: Передаю свои координаты! Квадрат: '..BOL..'! N'..cX..'E'..cY..'Z'..cZ..'!') calltype = -1 end
		if calltype == 2 then sampSendChat('/f [ГЛOНACС]: Потушили матовоз, нужно вскрыть. Квадрат: '..BOL..'! N'..cX..'E'..cY..'Z'..cZ..'!') calltype = -1 end
		if calltype == 3 then sampSendChat('/f [ГЛOНACС]: Потушили матовоз, нужна фура. Квадрат: '..BOL..'! N'..cX..'E'..cY..'Z'..cZ..'!') calltype = -1 end
		if calltype == 4 then sampSendChat('/f [ГЛOНACС]: Потушили матовоз, нужны грузчики. Квадрат: '..BOL..'! N'..cX..'E'..cY..'Z'..cZ..'!') calltype = -1 end
		if calltype == 5 then
			if folme:status() == 'dead' then
				sampSendChat('/f [ГЛOНACС]: Следуйте за мной! Квадрат: '..BOL..'! N'..bcX..'E'..bcY..'Z'..bcZ..'!')
				folme:run(calltype)
			else
				sampSendChat('/f [ГЛOНACС]: Режим следования отключен!')
				folme:terminate()
			end
			calltype = -1
		end
		if calltype == 6 then
			if folme:status() == 'dead' then
				sampSendChat('/f [ГЛOНACС]: Погоня! Я охотник. Квадрат: '..BOL..'! N'..bcX..'E'..bcY..'Z'..bcZ..'!')
				folme:run(calltype)
			else
				sampSendChat('/f [ГЛOНACС]: Режим OXOTHIK отключен!')
				folme:terminate()
			end
			calltype = -1
		end
		if calltype == 7 then
			if folme:status() == 'dead' then
				sampSendChat('/f [ГЛOНACС]: Погоня! Я жертва. Квадрат: '..BOL..'! N'..bcX..'E'..bcY..'Z'..bcZ..'!')
				folme:run(calltype)
			else
				sampSendChat('/f [ГЛOНACС]: Режим JERTVA отключен!')
				folme:terminate()
			end
			calltype = -1
		end
		if calltype == 8 and currentveh == 360 then
			if folme:status() == 'dead' then
				sampSendChat('/f [ГЛOНACС]: Везу фуру. Квадрат: '..KVX..'! Координаты: N'..bcX..'E'..bcY..'Z'..bcZ..'!')
				folme:run(calltype)
			else
				sampSendChat('/f [ГЛOНACС]: Режим FURA отключен!')
				folme:terminate()
			end
			calltype = -1
		end
		if calltype == 9 then
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
		if calltype == 10 then sampSendChat('/f [ГЛOНACС]: Будем грабить заправку. Квадрат: '..BOL..'! N'..bcX..'E'..bcY..'Z'..bcZ..'!') calltype = -1 end
		if calltype == 11 then sampSendChat('/f [ГЛOНACС]: Будем грабить алкоголь. Квадрат: '..BOL..'! N'..bcX..'E'..bcY..'Z'..bcZ..'!') calltype = -1 end
	end
end

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
	if calltype == 5 then
		if ifolu5:status() == 'dead' then
			sampSendChat('/f 10-4, принял ваши координаты, следую за тобой')
			ifolu5:run()
		else
			sampSendChat('/f 10-26 режим следования!')
			removePickup(pickup6a)
			removePickup(pickup6)
			removeBlip(marker6)
			ifolu5:terminate()
		end
	end
	if calltype == 6 then
		if ifolu6:status() == 'dead' then
			sampSendChat('/f 10-4 погоня, режим охотника')
			ifolu6:run()
		else
			sampSendChat('/f 10-26 погоня, режим охотника')
			removePickup(pickup7a)
			removePickup(pickup7)
			removeBlip(marker7)
			ifolu6:terminate()
		end
	end
	if calltype == 7 then
		if ifolu7:status() == 'dead' then
			sampSendChat('/f 10-4 погоня, режим жертвы')
			ifolu7:run()
		else
			sampSendChat('/f 10-26 погоня, режим жертвы')
			removePickup(pickup8a)
			removePickup(pickup8)
			removeBlip(marker8)
			ifolu7:terminate()
		end
	end
	if calltype == 8 then
		if ifolu8:status() == 'dead' then
			sampSendChat('/f 10-4 фура, отслеживаю координаты')
			ifolu8:run()
		else
			sampSendChat('/f 10-26 фура, не отслеживаю координаты')
			removePickup(pickup9a)
			removePickup(pickup9)
			removeBlip(marker9)
			ifolu8:terminate()
		end
	end
	if calltype == 9 and bolka ~= nil then
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
	if calltype == 10 and x11 ~= nil and y11 ~= nil then
		if doesPickupExist(pickup11) or doesPickupExist(pickup11a) or doesBlipExist(marker11) then removePickup(pickup11) removePickup(pickup11a) removeBlip(marker11) end
		sampSendChat('/f 10-4 ограбление заправки. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(x11, y11, cX, cY))..' м.')
		result, pickup11 = createPickup(whichpickuptype(calltype), 19, x11, y11, z11 + 0.7)
		result, pickup11a = createPickup(whichpickuptype(calltype), 14, x11, y11, z11 + 0.7)
		marker11 = addSpriteBlipForCoord(x11, y11, z11, whichmarkertype(calltype))
	end
	if calltype == 11 and x12 ~= nil and y12 ~= nil then
		if doesPickupExist(pickup12) or doesPickupExist(pickup12a) or doesBlipExist(marker12) then removePickup(pickup12) removePickup(pickup12a) removeBlip(marker12) end
		sampSendChat('/f 10-4 ограбление алкоголя. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(x12, y12, cX, cY))..' м.')
		result, pickup12 = createPickup(whichpickuptype(calltype), 19, x12, y12, z12 + 0.8)
		result, pickup12a = createPickup(whichpickuptype(calltype), 14, x12, y12, z12 + 0.8)
		marker12 = addSpriteBlipForCoord(x12, y12, z12, whichmarkertype(calltype))
	end
end
-- ОПРЕДЕЛЕНИЕ КВАДРАТА В КОТОРОМ НАХОДИТСЯ ИГРОК, ФУНКЦИОНАЛ БОЛЬНИЦЫ
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
	if getActiveInterior() == 0 then cX, cY, cZ = getCharCoordinates(playerPed) cX = math.ceil(cX) cY = math.ceil(cY) cZ = math.ceil(cZ)
	end
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
		[5] = 56,
		[6] = 19,
		[7] = 53,
		[8] = 51,
		[9] = 22,
		[10] = 52, -- запрака
		[11] = 52, -- алко
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
		[6] = 19605,
		[7] = 19605,
		[8] = 19605,
		[10] = 1650, -- запрака
		[11] = 18631, -- алко
	}
	return ptypes[asdad]
end
