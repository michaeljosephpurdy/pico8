pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

gs = "menu" -- menu, game, pause
menu_choice = 0
t = 0
actors = {}
player=nil

function _init()
 player = new_actor()
end

function _update()
 for a in all(actors) do
  a.dy = 0
  a.dx = 0
 end
 handle_input()
 for a in all(actors) do
  update_actor(a)
 end
end

function _draw()
 cls()
 if gs == "menu" then
  menu_draw()
 else
  game_draw()
 end
end

function menu_draw()
 print("press x - menu_choice" .. menu_choice)
end

function game_draw()
 for a in all(actors) do
  draw_actor(a)
 end
end

function new_actor()
 a={x=0, y=0, dx=0, dy=0, base_spr=1, spr=0, spd=2, s="idle", dir=0 , c=false}
 add(actors, a)
 return a
end

function update_actor(a)
 a.spr = a.base_spr
 a.dir = 0

 if a.dx == 1 then
  a.dir = 1
 end
 if a.dx == -1 then
  a.dir = 2
 end
 if a.dy == -1 then
  a.dir = -1
 end
 if a.dy == 1 then
  a.dir = 0
 end

 a.spr = a.spr + a.dir

 a.x += (a.dx * a.spd)
 a.y += (a.dy * a.spd)
end

function draw_actor(a)
 spr(a.spr, a.x, a.y)
end

function handle_input()
 if gs=="game" then
  if btn(0) then
   player.dx = -1
  end
  if btn(1) then
   player.dx = 1
  end
  if btn(2) then
   player.dy = -1
  end
  if btn(3) then
   player.dy = 1
  end
  if btn(4) then
  end
  if btn(5) then
  end
 else
  if btnp(0) then
  end
  if btnp(1) then
  end
  if btnp(2) then
   menu_choice -= 1
  end
  if btnp(3) then
   menu_choice += 1
  end
  if btnp(4) then
   if gs == "menu" then
    gs = "game"
   end
  end
  if btnp(5) then
  end
 end
end

__gfx__
00444400004444000044440000444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04444440044ff7400444f7f00f744440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
044444444f0ff040444ff0ffff0ff444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04ffff800ffffff004fffff00fffff40000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0888888f08ffff8f088f99900999f880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f299992ff299992f022ff220022ff220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
02f2222002f222200222222002222220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ff00f000ff00f0000ffff0000ffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00444400004444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04444440044ff7400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
044444444f0ff0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04ffff800ffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0888888f08ffff8f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f299992ff299992f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f2222220f22222200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ff00ff00ff00ff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00444400004444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04444440044ff7400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
044444444f0ff0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04ffff800ffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0888888008ffff800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f299992ff299992f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f2222f20f2222f200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00f00ff000f00ff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
