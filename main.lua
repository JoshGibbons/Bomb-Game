--
-- Project: game
-- Description: 
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- Copyright 2013 . All Rights Reserved.
-- 
local  startGame
local gamePlay
local coolBomb
local score = 0
local level = 2000
local explode = false
local endGame
 scoreDisplay = display.newText("Score: 0", 0,0, native.systemFont, 44)
scoreDisplay.isVisible = false

--create table of bombs
	bombs = {}
	
	for i = 1 ,  9   do
		bombs[i] = display.newImage( "bombCool.png" )
	    bombs[i].isVisible = false
	end 
	
	--create table of bad bombs
	redbombs = {}
	
	for i = 1 ,  9   do
		redbombs[i] = display.newImage( "bombRed.png" )
	    redbombs[i].isVisible = false
	end 
	
	------------------------------------------------------------
	
local function clearMenu(event)
	display.remove(event.target)
	display.remove( tx )
	tx = nil
	
	startGame()
	
end
 -----------------------------------------------------------------

local function showMenu()

 tx = display.newText("Bombs!", display.contentHeight/4, display.contentWidth/2, native.systemFont, 44)
tx:setTextColor(255, 255, 255)
startBut = display.newImage("button.png") 
startBut.x = display.contentWidth/2
startBut.y = display.contentHeight - 250
startBut:addEventListener ( "tap", clearMenu )


end
-----------------------------------------------------------------
function startGame()
	


--Bomb Coordinates
	
	third = display.contentWidth/3
	fourth = display.contentHeight/4
	centerX = display.contentCenterX
	centerY = display.contentCenterY


	bombs[1].x =  centerX  - third
	bombs[1].y =  centerY - fourth
	bombs[1].isVisible = true
	bombs[2].x =  centerX 
	bombs[2].y =  centerY - fourth
	bombs[2].isVisible = true
	bombs[3].x =  centerX  + third
	bombs[3].y =  centerY - fourth
	bombs[3].isVisible = true
	bombs[4].x =  centerX  - third
	bombs[4].y =  centerY 
	bombs[4].isVisible = true
	bombs[5].x =  centerX 
	bombs[5].y =  centerY 
	bombs[5].isVisible = true
	bombs[6].x =  centerX  + third
	bombs[6].y =  centerY 
	bombs[6].isVisible = true
	bombs[7].x =  centerX  - third
	bombs[7].y =  centerY + fourth
	bombs[7].isVisible = true
	bombs[8].x =  centerX 
	bombs[8].y =  centerY + fourth
	bombs[8].isVisible = true
	bombs[9].x =  centerX  + third
	bombs[9].y =  centerY + fourth
	bombs[9].isVisible = true



	redbombs[1].x =  centerX  - third
	redbombs[1].y =  centerY - fourth
	redbombs[1].isVisible = false
	redbombs[1]:addEventListener ( "tap", coolBomb )
	redbombs[1].num = 1
	redbombs[2].x =  centerX 
	redbombs[2].y =  centerY - fourth
	redbombs[2].isVisible = false
	redbombs[2]:addEventListener ( "tap", coolBomb )
	redbombs[2].num = 2
	redbombs[3].x =  centerX  + third
	redbombs[3].y =  centerY - fourth
	redbombs[3].isVisible = false
	redbombs[3]:addEventListener ( "tap", coolBomb )
	redbombs[3].num = 3
	redbombs[4].x =  centerX  - third
	redbombs[4].y =  centerY 
	redbombs[4].isVisible = false
	redbombs[4]:addEventListener ( "tap", coolBomb )
	redbombs[4].num = 4
	redbombs[5].x =  centerX 
	redbombs[5].y =  centerY 
	redbombs[5].isVisible = false
	redbombs[5]:addEventListener ( "tap", coolBomb )
	redbombs[5].num = 5
	redbombs[6].x =  centerX  + third
	redbombs[6].y =  centerY 
	redbombs[6].isVisible = false
	redbombs[6]:addEventListener ( "tap", coolBomb )
	redbombs[6].num = 6
	redbombs[7].x =  centerX  - third
	redbombs[7].y =  centerY + fourth
	redbombs[7].isVisible = false
	redbombs[7]:addEventListener ( "tap", coolBomb )
	redbombs[7].num = 7
	redbombs[8].x =  centerX 
	redbombs[8].y =  centerY + fourth
	redbombs[8].isVisible = false
	redbombs[8]:addEventListener ( "tap", coolBomb )
	redbombs[8].num = 8
	redbombs[9].x =  centerX  + third
	redbombs[9].y =  centerY + fourth
	redbombs[9].isVisible = false
	redbombs[9]:addEventListener ( "tap", coolBomb )
	redbombs[9].num = 9

	gamePlay()

end
------------------------------------------------------------------
function coolBomb(event)

	redbombs[event.target.num].isVisible = false
	bombs[event.target.num].isVisible = true
	score = score + 1
	scoreDisplay.text = "Score: " ..  score
	
end
-----------------------------------------------------------------
local function getBomb()
	
	local number = math.random ( 9 )
	redbombs[number].isVisible = true
	bombs[number].isVisible = false
	
end
-------------------------------------------------------------------
local function checkExplode()

	print("level = " .. level)
	
	for i =1, 9 do
	if redbombs[i].isVisible == true
		then explode = true
	end
end

if (explode == true) then
	print("exploded!")
	endGame()
	
else 
		
gamePlay()
end
	
	
--if (score < 90) then
		--if (score%10 == 0) then
				 level = level - 50
		--end
	--end

end
--------------------------------------------------------------
local function delay()
	timer.performWithDelay ( level , checkExplode)
end

function gamePlay()
	print(score)
	scoreDisplay.isVisible = true
	getBomb()
	delay()
	

end
---------------------------------------------------------------------

--OnStart

showMenu()


--Closing functions

function endGame()
	
	level = 2000
	scoreDisplay.isVisible = false
	score = 0
	scoreDisplay.text = "Score: " .. score
	
	for i = 1 ,  9   do

	    bombs[i].isVisible = false
	end 
	for i = 1 ,  9   do

	    redbombs[i].isVisible = false
	end 
	
	explode = false
	showMenu()
	
end

