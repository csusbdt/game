## Patterns

|  Pattern  |  Description  |
|-----------|---------------|
| SINGLETON | Modules that represent single object instances. |
| METATABLE | Singleton modules that provide access to a metatable.  Their names end with __\_mt__. The purpose of metatables is to create objects directly, without the use of a factory. |
| FACTORY   | Modules that have one or more create methods. Their names end with __\_factory__.|
| RESOURCE  | Singleton modules that manage the loading and unloading of resources. Unloading is done when all references to a resource are garbage collected. Resource modules are factories that don't end with _factory.  However, they are all located under the path __res.*__ |

## Resource modules

* res.textures
* res.fonts
* res.music
* res.sounds
* res.waves

## Utility modules

* util.savefile
* util.camera
* util.input
* util.anim_factory  
* util.button_factory

## UI modules

* ui.hud

## Map modules

Maps are singleton objects that end with "_map". They are populated
with objects from factories that are collected into a module
ending with "_objs".

* maps.map_mt
* maps.dessert.dessert_map 
* maps.dessert.dessert_objs  

## Player modules

* player.player_mt
* player.kurock.kurock_player

## OS X

After installing libogg, I needed to build libvorbis with the following:

~~~
./configure  --with-ogg-libraries=/usr/local/lib --with-ogg-includes=/usr/local/include
~~~

