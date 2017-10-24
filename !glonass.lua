script_name("GLONASS")

script_version("0.1")
script_author("j.b.")
-- достаем координаты из захваченных строк в чате
function coord(text)
	tempx, tempy, tempz = string.match(text, "(%d+)E(%d+)Z(%d+)")
	tempx = tempx - 3000
	tempy = tempy - 3000
	tempz = tempz - 0.5
end
-- если взят пикап, убирает маркер
function cleaner()
	if hasPickupBeenCollected(pickup1) then removeBlip(marker1) end
	if hasPickupBeenCollected(pickup2) then removeBlip(marker2) end
	if hasPickupBeenCollected(pickup3) then removeBlip(marker3) end
	if hasPickupBeenCollected(pickup4) then removeBlip(marker4) end
	if hasPickupBeenCollected(pickup5) then removeBlip(marker5) end
	if hasPickupBeenCollected(pickup6) then removeBlip(marker6) end
	if hasPickupBeenCollected(pickup7) then removeBlip(marker7) end
	if hasPickupBeenCollected(pickup8) then removeBlip(marker8) end
	if hasPickupBeenCollected(pickup9) then removeBlip(marker9) end
	if hasPickupBeenCollected(pickup10) then removeBlip(marker10) end
	if hasPickupBeenCollected(pickup11) then removeBlip(marker11) end
	if hasPickupBeenCollected(pickup12) then removeBlip(marker12) end
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
	local script = thisScript()
	script:reload()
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
			--	sampSendChat('Определен 10-34: '..x1..' '..y1..' '..z1)
		end
		-- просто передать координаты
		if string.find(lcs, 'Передаю свои координаты! Квадрат:', 1, true) then
			coord(lcs)
			x2 = tempx
			y2 = tempy
			z2 = tempz
			--		sampSendChat('Определен Передаю свои координаты! Квадрат: '..x2..' '..y2..' '..z2), color)
		end
		-- вскрыть фуру
		if string.find(lcs, ' Потушили матовоз, нужно вскрыть.', 1, true) then
			coord(lcs)
			x3 = tempx
			y3 = tempy
			z3 = tempz
			--	sampSendChat('Определен  Потушили матовоз, нужно вскрыть.! Квадрат: '..x3..' '..y3..' '..z3), color)
		end
		-- нужна фура
		if string.find(lcs, ' Потушили матовоз, нужна фура.', 1, true) then
			coord(lcs)
			x4 = tempx
			y4 = tempy
			z4 = tempz
			--	sampSendChat('Определен  Потушили матовоз, нужна фура.! Квадрат: '..x4..' '..y4..' '..z4), color)
		end
		-- грузим фуру
		if string.find(lcs, ' Потушили матовоз, нужны грузчики.', 1, true) then
			coord(lcs)
			x5 = tempx
			y5 = tempy
			z5 = tempz
			--	sampSendChat('Определен Потушили матовоз, нужна фура.! Квадрат: '..x5..' '..y5..' '..z5), color)
		end
		-- грабим заправку
		if string.find(lcs, ' заправку', 1, true) then
			coord(lcs)
			x11 = tempx
			y11 = tempy
			z11 = tempz
			--		sampSendChat('Определено ограбление заправки!'..x11..' '..y11..' '..z11), color)
		end
		-- грабим алко
		if string.find(lcs, ' алкоголь', 1, true) then
			coord(lcs)
			x12 = tempx
			y12 = tempy
			z12 = tempz
			--	sampSendChat('Определено ограбление алко '..x12..' '..y12..' '..z12), color)
		end
	end
end

function main()
	while not isSampAvailable() do wait(200) end
	nick = sampGetPlayerNickname(0)
	sampRegisterChatCommand('glean', glean)
	hotkey = 0
	if nick == "Mike_Rein" and sampGetCurrentServerAddress() == '185.169.134.11' then
		sampAddChatMessage(('ГЛОНАСС запущен. Моргану Дефендеру по пасти! Нубороверка нуболицензии пройдена. Лицензия принадлежит: '..nick..'!'), 0xEFBFB)
		while true do
			wait(0)
			--	sampAddChatMessage(nick)
			chatcapture()
			whereami()
			cleaner()
			callhelp()
			iwillhelp()
		end
	else
		sampAddChatMessage(('ГЛОНАСС отключён. Проверка лицензии не пройдена.'), 0xEFBFB)
	end
end


function callhelp()
	if not isPauseMenuActive() and isPlayerPlaying(playerHandle) and sampIsChatInputActive() == false and isKeyDown(80) then
		sampShowDialog(983, "ГЛОНАСС by rubbishman - ВЫЗВАТЬ", string.format("[1] Вызов помощи в перестрелке (статичная метка)\n[2] Передать свои координаты (статичная метка)\n[3] Матовоз потушен, требуется вскрыть (статичная метка)\n[4] Матовоз потушен, требуется фура (статичная метка)\n[5] Матовоз потушен, требуется загрузить (статичная метка)\n[6] Следуйте за мной (динамичная метка)\n[7] Вызов помощь в погоне, охотник (динамичная метка)\n[8] Вызов помощь в погоне, жертва (динамичная метка)\n[9] Везу фуру (каждые 10 сек обновление)\n[10] Вызвать помощь в ограблении больницы \n[11] Вызвать помощь в ограблении заправки (статичная метка)\n[12] Вызвать помощь в ограблении бара (статичная метка)"), "Выбрать", "Закрыть", 2)
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
	if not isPauseMenuActive() and isPlayerPlaying(playerHandle) and sampIsChatInputActive() == false and isKeyDown(90) then
		sampShowDialog(984, "ГЛОНАСС by rubbishman - ПРИНЯТЬ ВЫЗОВ", string.format("[1] Вызов помощи в перестрелке (статичная метка)\n[2] Передать свои координаты (статичная метка)\n[3] Матовоз потушен, требуется вскрыть (статичная метка)\n[4] Матовоз потушен, требуется фура (статичная метка)\n[5] Матовоз потушен, требуется загрузить (статичная метка)\n[6] Следуйте за мной (динамичная метка)\n[7] Вызов помощь в погоне, охотник (динамичная метка)\n[8] Вызов помощь в погоне, жертва (динамичная метка)\n[9] Везу фуру (каждые 10 сек обновление)\n[10] Вызвать помощь в ограблении больницы\n[11] Вызвать помощь в ограблении заправки (статичная метка)\n[12] Вызвать помощь в ограблении бара (статичная метка)"), "Выбрать", "Закрыть", 2)
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

function bhelp(calltype)
	whereami()
	color = 0xEFB21
	local X, Y, Z = getCharCoordinates(playerPed)
	X = math.ceil(X + 3000)
	Y = math.ceil(Y + 3000)
	Z = math.ceil(Z)
	if calltype == 0 then sampSendChat('/f [ГЛOНACС]: 10-34 '..KVX..'! Мои координаты: N'..X..'E'..Y..'Z'..Z..'!') calltype = -1 end
	if calltype == 1 then sampSendChat('/f [ГЛOНACС]: Передаю свои координаты! Квадрат: '..KVX..'! N'..X..'E'..Y..'Z'..Z..'!') calltype = -1 end
	if calltype == 2 then sampSendChat('/f [ГЛOНACС]: Потушили матовоз, нужно вскрыть. Квадрат: '..KVX..'! Координаты: N'..X..'E'..Y..'Z'..Z..'!') calltype = -1 end
	if calltype == 3 then sampSendChat('/f [ГЛOНACС]: Потушили матовоз, нужна фура. Квадрат: '..KVX..'! Координаты: N'..X..'E'..Y..'Z'..Z..'!') calltype = -1 end
	if calltype == 4 then sampSendChat('/f [ГЛOНACС]: Потушили матовоз, нужны грузчики. Квадрат: '..KVX..'! Координаты: N'..X..'E'..Y..'Z'..Z..'!') calltype = -1 end
	if calltype == 5 then sampSendChat('/f [ГЛOНACС]: Следуйте за мной! Квадрат: '..KVX..'! Координаты: N'..X..'E'..Y..'Z'..Z..'!') calltype = -1 end
	if calltype == 6 then sampSendChat('/f [ГЛOНACС]: Нужна помощь в погоне! Я охотник. Квадрат: '..KVX..'! Координаты: N'..X..'E'..Y..'Z'..Z..'!') calltype = -1 end
	if calltype == 7 then sampSendChat('/f [ГЛOНACС]: Нужна помощь в погоне! Я жертва. Квадрат: '..KVX..'! Координаты: N'..X..'E'..Y..'Z'..Z..'!') calltype = -1 end
	if calltype == 8 then sampSendChat('/f [ГЛOНACС]: Везу фуру. Квадрат: '..KVX..'! Координаты: N'..X..'E'..Y..'Z'..Z..'!') calltype = -1 end
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
			sampSendChat('/f Хочу ограбить больницу, мой квадрат: '..BOL) typ = -1
		end
	end
	if calltype == 10 then sampSendChat('[ГЛOНACС]: Будем грабить заправку. Квадрат: '..KVX..'! Координаты: N'..X..'E'..Y..'Z'..Z..'!') calltype = -1 end
	if calltype == 11 then sampSendChat('[ГЛOНACС]: Будем грабить алкоголь. Квадрат: '..KVX..'! Координаты: N'..X..'E'..Y..'Z'..Z..'!') calltype = -1 end
end


function bihelp(calltype)
	local tx, ty, tz = getCharCoordinates(playerPed)
	tx = math.ceil(tx)
	ty = math.ceil(ty)
	if calltype == 0 and x1 ~= nil and y1 ~= nil then
		if doesPickupExist(pickup1) or doesBlipExist(marker1) then removePickup(pickup1) removeBlip(marker1) end
		sampSendChat('/f 10-4 10-34 . Дистанция: '..math.ceil(getDistanceBetweenCoords2d(x1, y1, tx, ty))..' метров!')
		result, pickup1 = createPickup(whichpickuptype(calltype), 8, x1, y1, z1)
		marker1 = addSpriteBlipForCoord(x1, y1, z1, whichmarkertype(calltype))
	end
	if calltype == 1 and x2 ~= nil and y2 ~= nil then
		if doesPickupExist(pickup2) or doesBlipExist(marker2) then removePickup(pickup2) removeBlip(marker2) end
		sampSendChat('/f Принял ваши координаты. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(x2, y2, tx, ty))..' метров!')
		result, pickup2 = createPickup(whichpickuptype(calltype), 8, x2, y2, z2)
		marker2 = addSpriteBlipForCoord(x2, y2, z2, whichmarkertype(calltype))
	end
	if calltype == 2 and x3 ~= nil and y3 ~= nil then
		if doesPickupExist(pickup3) or doesBlipExist(marker3) then removePickup(pickup3) removeBlip(marker3) end
		sampSendChat('/f 10-4 матовоз, который нужно вскрыть. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(x3, y3, tx, ty))..' метров!')
		result, pickup3 = createPickup(whichpickuptype(calltype), 8, x3, y3, z3)
		marker3 = addSpriteBlipForCoord(x3, y3, z3, whichmarkertype(calltype))
	end
	if calltype == 3 and x4 ~= nil and y4 ~= nil then
		if doesPickupExist(pickup4) or doesBlipExist(marker4) then removePickup(pickup4) removeBlip(marker4) end
		sampSendChat('/f 10-4 матовоз, к которому нужна фура. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(x4, y4, tx, ty))..' метров!')
		result, pickup4 = createPickup(whichpickuptype(calltype), 8, x4, y4, z4)
		marker4 = addSpriteBlipForCoord(x4, y4, z4, whichmarkertype(calltype))
	end
	if calltype == 4 and x5 ~= nil and y5 ~= nil then
		if doesPickupExist(pickup5) or doesBlipExist(marker5) then removePickup(pickup5) removeBlip(marker5) end
		sampSendChat('/f 10-4 матовоз, грузчики уже в пути. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(x5, y5, tx, ty))..' метров!')
		result, pickup5 = createPickup(whichpickuptype(calltype), 8, x5, y5, z5)
		marker5 = addSpriteBlipForCoord(x5, y5, z5, whichmarkertype(calltype))
	end
	if calltype == 9 then
		sampSendChat('/f 10-4 ограбление больницы')
	end
	if calltype == 10 and x11 ~= nil and y11 ~= nil then
		if doesPickupExist(pickup11) or doesBlipExist(marker11) then removePickup(pickup11) removeBlip(marker11) end
		sampSendChat('/f 10-4 ограбление заправки. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(x11, y11, tx, ty))..' метров!')
		result, pickup11 = createPickup(whichpickuptype(calltype), 8, x11, y11, z11)
		marker11 = addSpriteBlipForCoord(x11, y11, z11, whichmarkertype(calltype))
	end
	if calltype == 11 and x12 ~= nil and y12 ~= nil then
		if doesPickupExist(pickup12) or doesBlipExist(marker12) then removePickup(pickup12) removeBlip(marker12) end
		sampSendChat('/f 10-4 ограбление алкоголя. Дистанция: '..math.ceil(getDistanceBetweenCoords2d(x12, y12, tx, ty))..' метров!')
		result, pickup12 = createPickup(whichpickuptype(calltype), 8, x12, y12, z12)
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
		[10] = 1650, -- запрака
		[11] = 18631, -- алко
	}
	return ptypes[asdad]
end
