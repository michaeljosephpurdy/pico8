pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

gs = "menu" -- menu, game, pause
menu_choice = 0
actors = {}
player = nil

function _init()
 player = new_actor(0, 40, 40)
 mob = new_actor(1)
end

function _update()
 for a in all(actors) do
  a.s = "idle"
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
 print("press z to start")
end

function game_draw()
 for a in all(actors) do
  spr(a.spr, a.x, a.y)
 end
end

function new_actor(bs, x, y)
 a={x=x or 0, y=y or 0, dx=0, dy=0, base_spr=bs, spr=bs*4, spd=2, s="idle", dir=0 , c=false}
 add(actors, a)
 return a
end

function update_actor(a)
 if a.s != "idle" then
  a.spr = a.base_spr * 4
  if a.dx == 1 then
   a.dir = 2
  end
  if a.dx == -1 then
   a.dir = 3
  end
  if a.dy == -1 then
   a.dir = 0
  end
  if a.dy == 1 then
   a.dir = 1
  end
 
  a.spr = a.spr + a.dir
  a.x += (a.dx * a.spd)
  a.y += (a.dy * a.spd)
 end
end

function handle_input()
 if gs=="game" then
  if btn(0) then
   player.s = "moving"
   player.dx = -1
  end
  if btn(1) then
   player.s = "moving"
   player.dx = 1
  end
  if btn(2) then
   player.s = "moving"
   player.dy = -1
  end
  if btn(3) then
   player.s = "moving"
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
00444400004444000044440000444400003553000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04444440044ff7400444f7f00f744440006006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
044444444f0ff040444ff0ffff0ff444036006300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04ffff800ffffff004fffff00fffff40333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0888888f08ffff8f088f99900999f880bb3333bb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f299992ff299992f022ff220022ff220bbb44bbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
02f2222002f222200222222002222220004444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ff00f000ff00f0000ffff0000ffff00044404400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
