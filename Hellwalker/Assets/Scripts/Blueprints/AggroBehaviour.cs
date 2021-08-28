using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AggroBehaviour : BlueprintBehaviour
{
	protected override void OnStateEntered()
	{
		if (_view._movementType == MovementType.MELEE || _view._movementType == MovementType.RANGE)
		{
			_view.BasicSetGoal();
		}
	}

	protected override void OnStateUpdate()
	{

	}

	protected override void OnStateExited()
	{
		// stub
	}
}
