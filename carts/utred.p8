pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- utred
-- michael purdy

t = 0
player={}
player.x, player.y = 0, 0
player.dx, player.dy = 0, 0


function _init()
 t = 0
end

function _update()
 if(btn(1)) then
  print("1")
 end
 if(btn(2)) then
  print("2")
 end
end

function _draw()
end
