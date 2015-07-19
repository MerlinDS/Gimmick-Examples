/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2015 Andrew Salomatin (MerlinDS)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

package systems
{

	import components.Destination;
	import components.Display;
	import components.Label;
	import components.Position;
	import components.Velocity;

	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;

	import org.gimmick.core.Gimmick;
	import org.gimmick.core.IEntity;
	import org.gimmick.core.IIdleSystem;

	/**
	 * System for initialization.
	 * Create new entities on start of application.
	 */
	public class InitialSystem implements IIdleSystem
	{

		private var _container:DisplayObjectContainer;
//======================================================================================================================
//{region											PUBLIC METHODS
		/**
		 * Constructor.
		 * @param containter Container for view of new entities
		 */
		public function InitialSystem(containter:DisplayObjectContainer)
		{
			_container = containter;
		}

		public function activate():void
		{
			this.createEntities();
			this.createButton();
			//just remove itself from Gimmick
			Gimmick.removeSystem(InitialSystem);
		}



		public function initialize():void
		{
		}

		public function dispose():void
		{
			//remove links from system instance
			_container = null;
		}

		public function deactivate():void
		{

		}

//} endregion PUBLIC METHODS ===========================================================================================
//======================================================================================================================
//{region										PRIVATE\PROTECTED METHODS
		/**
		 * Create some entities
		 */
		private function createEntities():void
		{
			for (var i:int = 0; i < 150; i++)
			{
				var entity:IEntity = Gimmick.createEntity();
				var position:Position = entity.add(new Position());
				//set random position
				position.x = Math.round(1024 * Math.random());
				position.y = Math.round(768 * Math.random());
				//add initial destination (will be updated by MovementSystem)
				entity.add(new Destination(position.x, position.y));
				entity.add(new Velocity());
				//create entity view and add it to stage
				var view:Sprite = new Sprite();
				var color:uint = Math.random() * 0xFFFFFF;
				view.graphics.beginFill(color);
				view.graphics.drawCircle(0, 0, 20);
				view.graphics.endFill();
				view.x = position.x;
				view.y = position.y;
				entity.add(new Display(view));
				_container.addChild(view);
			}
		}

		/**
		 * Create button as entity.
		 * GUISystem will controlling it
		 */
		private function createButton():void
		{
			var entity:IEntity = Gimmick.createEntity('button');
			var view:Sprite = new Sprite();
			view.graphics.beginFill(0xCCCCCC);
			view.graphics.drawRect(-100, -25, 200, 50);
			view.graphics.endFill();
			//add label
			var label:TextField = new TextField();
			label.selectable = false;
			label.autoSize = TextFieldAutoSize.LEFT;
			label.y = -25;
			label.x = -100;
			view.addChild(label);
			//add components to button
			entity.add(new Label(label));
			entity.add(new Display(view));
			entity.add(new Position(1024 - 100, 768 - 25));
			_container.addChild(view);
		}
//} endregion PRIVATE\PROTECTED METHODS ================================================================================
//======================================================================================================================
//{region											GETTERS/SETTERS

//} endregion GETTERS/SETTERS ==========================================================================================
	}
}
