using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BlueprintBehaviour : StateMachineBehaviour
{
	private bool _stateEntered = false;
	protected Blueprint _blueprint;
	protected EnemyView _view;
	public override void OnStateEnter(Animator animator, AnimatorStateInfo stateInfo, int layerIndex)
	{
		if (_stateEntered)
		{
			return;
		}

		_stateEntered = true;
		_blueprint = animator.GetComponent<Blueprint>();
		_view = animator.GetComponent<EnemyView>();

		OnStateEntered();
	}

	public override void OnStateUpdate(Animator animator, AnimatorStateInfo stateInfo, int layerIndex)
	{
		OnStateUpdate();
	}

	public override void OnStateExit(Animator animator, AnimatorStateInfo stateInfo, int layerIndex)
	{
		if (!_stateEntered)
		{
			return;
		}

		_stateEntered = false;
		OnStateExited();
	}

	protected virtual void OnStateEntered()
	{
		// stub
	}

	protected virtual void OnStateUpdate()
	{
		// stub
	}

	protected virtual void OnStateExited()
	{
		// stub
	}
}
