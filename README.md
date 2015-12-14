## Patterns

* FACTORY   Modules that have one or more create methods; their names end with _factory.
* SINGLETON Modules that represent a singel object instance.
* RESOURCE  Modules that manage the loading and unloading of resources.
            Unloading is done when all references to a resource are garbage collected.
            Resource modules are singltons.

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

* maps.factory       FACTORY     ******************* Create this. **********************
* maps.dessert.main  SINGLETON   ************** Merge with objs and call it "maps.dessert" ***********
* maps.dessert.obj_factory  

## Player modules

* players.factory    FACTORY
* players.wolf       SINGLETON  ************************ Get rid of wolf folder. *****************************


