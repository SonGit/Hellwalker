using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class IdleBehaviour : BlueprintBehaviour
{
	protected override void OnStateEntered()
	{
		
	}

	protected override void OnStateUpdate()
	{
		DestructibleObjectScript destructibleObjectScript = (DestructibleObjectScript)_view.GetComponent(typeof(DestructibleObjectScript));
		bool flag = false;

		if (destructibleObjectScript.wasdamaged && _view._awakeOnDamage)
		{
			flag = true;
		}
		if ((_view.CheckLoS() && _view.CheckFoV()) || flag)
		{
			_view._awakeDelay -= Time.deltaTime;
			if (_view._awakeDelay < (float)0)
			{
				_view._awakeDelay = (float)0;
			}
			if (_view._awakeDelay <= (float)0)
			{
				if (_blueprint.GetState() == BlueprintState.IDLE)
				{
					_blueprint.SetState(BlueprintState.AGGRO);
					//_view.awakestuff();
				}
			}
		}
	}

	protected override void OnStateExited()
	{
		// stub
	}
}
