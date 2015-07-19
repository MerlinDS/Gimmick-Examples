#Simple Example

Very simple application that show basic usage of the Gimmick framework.
This app create heap of entities and moves them in viewport.
Also you can control pause/resume of application.

[Builded application]()

##Structure

Application has two packages: components and systems.

###Components
* Destination - component that contains coordinates of entity destination. 
New coordinates of entity's destination will be calculated randomly by MovementSystem
* Display - component that contains view of entity.
* Position - component that contains current coordinates of entity (position in viewport).
* Velocity - component that contains velocity vector of entity.
* Label - component that contains text field of entity (used by button)

###Systems

* InitialSystem - create entities for this application. Remove itself from app, on end of initialization. (Implements IIdleSystem interface)
* MovementSystem - changes position of the entity. Also, calculate new destination's coordinates when entity near old destination. (Implements IEntitySystem interface)
* DisplaySystem - changes position of view of entity. (Implements IProcessingSystem interface)
* GUISystem - controls state of application, and listens button clicks.

IIdleSystems doesn't take part in iteration cycle, but can affect on application's behavior when they were activated.

##Dependencies

gimmick-0.1.x.swc - Gimmick framework file 