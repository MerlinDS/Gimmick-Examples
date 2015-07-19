#Simple Example

Very simple application that show basic usage of the Gimmick framework.
This app create heap of entities and moves them in viewport.
Also you can control pause/resume of application.

[Builded application]()

##Structure

Application has two packages: [components] and [systems]().

###Components
* [Destination]() - component that contains coordinates of entity destination. 
New coordinates of entity's destination will be calculated randomly by MovementSystem
* [Display]() - component that contains view of entity.
* [Position]() - component that contains current coordinates of entity (position in viewport).
* [Velocity]() - component that contains velocity vector of entity.
* [Label]() - component that contains text field of entity (used by button)

###Systems

* [InitialSystem](https://github.com/MerlinDS/Gimmick-Examples/tree/master/Simple-Example/src/systems/InitialSystem) 
`implement IIdleSystem`- create entities for this application. Remove itself from app, on end of initialization.
* [MovementSystem](https://github.com/MerlinDS/Gimmick-Examples/tree/master/Simple-Example/src/systems/MovementSystem) 
`implement IEntitySystem` - changes position of the entity. Also, calculate new destination's coordinates when entity near old destination.
* [DisplaySystem](https://github.com/MerlinDS/Gimmick-Examples/tree/master/Simple-Example/src/systems/DisplaySystem) 
`implement IProcessingSystem` - changes position of view of entity.
* [GUISystem](https://github.com/MerlinDS/Gimmick-Examples/tree/master/Simple-Example/src/systems/GUISystem) 
`implement IIdleSystem` - controls state of application, and listens button clicks.

[IIdleSystems]() doesn't take part in iteration cycle, but can affect on application's behavior when they were activated.

##Dependencies

[gimmick-0.1.x.swc](https://github.com/MerlinDS/Gimmick) - Gimmick framework file 