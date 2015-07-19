#Simple Example

Very simple application that show basic usage of the Gimmick framework.
This app create heap of entities and moves them in viewport.
Also you can control pause/resume of application.

[Builded application]()

##Structure

Application has two packages: [components](https://github.com/MerlinDS/Gimmick-Examples/tree/master/Simple-Example/src/components) 
and [systems](https://github.com/MerlinDS/Gimmick-Examples/tree/master/Simple-Example/src/systems/).

###Components
* [Destination](https://github.com/MerlinDS/Gimmick-Examples/tree/master/Simple-Example/src/components/Destination.as)
 - component that contains coordinates of entity destination. 
New coordinates of entity's destination will be calculated randomly by MovementSystem
* [Display](https://github.com/MerlinDS/Gimmick-Examples/tree/master/Simple-Example/src/components/Display.as)
 - component that contains view of entity.
* [Position](https://github.com/MerlinDS/Gimmick-Examples/tree/master/Simple-Example/src/components/Position.as)
 - component that contains current coordinates of entity (position in viewport).
* [Velocity](https://github.com/MerlinDS/Gimmick-Examples/tree/master/Simple-Example/src/components/Velocity.as)
 - component that contains velocity vector of entity.
* [Label](https://github.com/MerlinDS/Gimmick-Examples/tree/master/Simple-Example/src/components/Label.as)
 - component that contains text field of entity (used by button)

###Systems

* [InitialSystem](https://github.com/MerlinDS/Gimmick-Examples/tree/master/Simple-Example/src/systems/InitialSystem.as) 
`implement IIdleSystem`- create entities for this application. Remove itself from app, on end of initialization.
* [MovementSystem](https://github.com/MerlinDS/Gimmick-Examples/tree/master/Simple-Example/src/systems/MovementSystem.as) 
`implement IEntitySystem` - changes position of the entity. Also, calculate new destination's coordinates when entity near old destination.
* [DisplaySystem](https://github.com/MerlinDS/Gimmick-Examples/tree/master/Simple-Example/src/systems/DisplaySystem.as)
`implement IProcessingSystem` - changes position of view of entity.
* [GUISystem](https://github.com/MerlinDS/Gimmick-Examples/tree/master/Simple-Example/src/systems/GUISystem.as) 
`implement IIdleSystem` - controls state of application, and listens button clicks.

[IIdleSystems]() doesn't take part in iteration cycle, but can affect on application's behavior when they were activated.

##Dependencies

[gimmick-0.1.x.swc](https://github.com/MerlinDS/Gimmick) - Gimmick framework file 