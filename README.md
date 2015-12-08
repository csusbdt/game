## Patterns

* FACTORY modules (Have one or more create methods.)
* SINGLETON modules (Can be standalone or instance of factory.)

## Resource modules

* Manage resource instances.
* res.textures  FACTORY
* res.fonts     FACTORY
* res.music     FACTORY
* res.sounds    FACTORY
* res.waves     FACTORY

## Utility modules

* util.savefile  SINGLETON   ************* Rename "eng" to "util". *****************
* util.camera    SINGLETON
* util.input     SINGLETON
* util.buttons   FACTORY
* util.anim      FACTORY

## UI modules

* hud.main  ************* Change to ui.hud ******************

## Map modules

* maps.factory       FACTORY     ******************* Create this. **********************
* maps.dessert.main  SINGLETON   ************** Merge with objs and call it "maps.dessert" ***********
* maps.dessert.objs  SINGLETON   ***** merge *****

## Player modules

* players.factory    FACTORY
* players.wolf       SINGLETON  ************************ Get rid of wolf folder. *****************************


