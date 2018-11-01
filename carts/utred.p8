pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- utred
-- michael purdy

gs = "menu" -- menu, game
t = 0
all_actors = {}
function _init()
 player = new_actor()
 player.x = 20
end

function _update()
 if(btn(0)) then
  player.dx = -1
 end
 if(btn(1)) then
  player.dx = 1
 end
 if(btn(2)) then
  player.dy = -1
 end
 if(btn(3)) then
  player.dy = 1
 end
 if(btn(4)) then
  print("4")
 end
 if(btn(5)) then
  print("5")
 end

 for a in all(all_actors) do
  update_actor(a)
 end

 player.dx = 0
 player.dy = 0
end

function _draw()
 for a in all(all_actors) do
  draw_actor(a)
 end
end

function new_actor()
 a={x=0, y=0, dx=0, dy=0, spr=0, spd=1, s="idle", c=false}
 add(all_actors, a)
 return a
end

function update_actor(a)
 a.x += (a.dx * a.spd)
 a.y += (a.dy * a.spd)
end

function draw_actor(a)
 spr(a.spr, a.x, a.y)
end