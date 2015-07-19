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

	import components.Display;
	import components.Position;

	import org.gimmick.collections.IEntities;
	import org.gimmick.core.Gimmick;
	import org.gimmick.core.IEntity;
	import org.gimmick.core.IEntitySystem;
	import org.gimmick.core.IProcessingSystem;

	/**
	 * System that controlls entities with Display component
	 */
	public class DisplaySystem implements IProcessingSystem
	{

		//======================================================================================================================
//{region											PUBLIC METHODS
		public function DisplaySystem()
		{
		}

		public function process(entity:IEntity, entities:IEntities):void
		{
			var display:Display = entity.get(Display);
			if(entity.has(Position))
			{
				//change position of view
				var position:Position = entity.get(Position);
				display.view.x = position.x;
				display.view.y = position.y;
			}
			//in case when need to update entity display without position component
		}

		public function initialize():void
		{
		}

		public function dispose():void
		{
		}

		public function activate():void
		{
		}

		public function deactivate():void
		{
		}
//} endregion PUBLIC METHODS ===========================================================================================
//======================================================================================================================
//{region										PRIVATE\PROTECTED METHODS

//} endregion PRIVATE\PROTECTED METHODS ================================================================================
//======================================================================================================================
//{region											GETTERS/SETTERS
		public function get targetEntities():IEntities
		{
			//initialize entities collection for future iterations
			return Gimmick.getEntities(Display);
		}
//} endregion GETTERS/SETTERS ==========================================================================================
	}
}
