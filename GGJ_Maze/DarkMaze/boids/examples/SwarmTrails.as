﻿/** * Swarm Trails * Author: Andrew White <andrew@vohm.com>**/package {	import flash.display.DisplayObject;	import flash.display.MovieClip;	import flash.display.Sprite;	import flash.events.Event;			import com.vohm.utils.MathUtils;	import com.vohm.boids.*		public class SwarmTrails extends Sprite {				private var swarm:Boids;		private var max_flies:uint;		private var fly_stack:Array;		private var container:Sprite;				public function SwarmTrails():void {			initObjects();			initListeners();		}		private function initObjects():void {			swarm = new Boids(20, 200, 150, 200, 5);						max_flies = 800;			fly_stack = new Array();			container = new Sprite();			container.x = 60;			container.y = 45;			addChild(container);		}				private function initListeners():void {			addEventListener(Event.ENTER_FRAME, onEnterFrame);     }				private function onEnterFrame(e:Event):void {						var cx:Number = MathUtils.constrain(container.mouseX, 0, 200);			var cy:Number = MathUtils.constrain(container.mouseY, 0, 150);			swarm.goal(cx, cy, 100);			swarm.update();						var i:uint = 0			for (i; i < swarm.boids.length; i++) {				var boid:Boid = swarm.boids[i];				var z:Number = MathUtils.constrain(boid.z, 25, 150) / 100;				var fly:FlyFade = new FlyFade();				fly.x = boid.x;				fly.y = boid.y;				fly.scaleX = z;				fly.scaleY = z;				fly.rotation = boid.angle();								fly_stack.push(fly);						container.addChild(fly);				if (fly_stack.length > max_flies) {					fly = fly_stack.shift();					container.removeChild(fly);				}			}    }			}	}