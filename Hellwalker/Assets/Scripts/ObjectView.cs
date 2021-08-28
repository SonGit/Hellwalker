using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public abstract class ObjectView : MonoBehaviour
{
    public abstract void OnCreate(Context context);
}

public enum MovementType
{
	MELEE,
	RANGE
}

[SelectionBase]
public abstract class EnemyView : ObjectView
{
	[Header("Gameplay")]
	[Tooltip("Always point to Player")]
	public GameObject _myTarget;
	[Tooltip("Movement Type")]
	public MovementType _movementType;
	[Tooltip("Movement Speed")]
	public float _mySpeed;
	[Tooltip("Shoudl this AI acitvated upon damaged ?")]
	public bool _awakeOnDamage;
	[Tooltip("Delay for AI activation")]
	public float _awakeDelay;

	[Header("Internal Logic")]
	[Tooltip("Set to compensate model's eyes height")]
	public float _visionOffset;
	[Tooltip("Layers that block raycasts")]
	public LayerMask BlockingLayers;

	// Private references
	private Vector3 _myGoal; // Position of current goal
	private float _stopMovement;

	private NavMeshAgent navAgent;
	private NavMeshAgent _navAgent
    {
		get
		{
			if(navAgent == null)
            {
				navAgent = (NavMeshAgent)this.GetComponent(typeof(NavMeshAgent));
			}
			return navAgent;
		}
    }

	protected virtual void Update()
	{
		CheckStopMovement();
	}

	/// <summary>
    /// Check if target is in line-of-sight by raycasting to it
    /// </summary>
    /// <returns></returns>
	public virtual bool CheckLoS()
	{
		RaycastHit raycastHit = default(RaycastHit);
		GameObject myTarget = this._myTarget;
		bool result = false;
		Vector3 vector = this.transform.position + new Vector3((float)0, this._visionOffset, (float)0);
		bool flag = Physics.Raycast(vector, (myTarget.transform.position - vector).normalized, out raycastHit, Vector3.Distance(vector, myTarget.transform.position), this.BlockingLayers);
		bool flag2 = false;
		if (flag)
		{
			if (raycastHit.transform.gameObject == this._myTarget)
			{
				flag2 = true;
			}
		}
		else
		{
			flag2 = true;
		}
		if (flag2)
		{
			result = true;
		}
		return result;
	}

	/// <summary>
    /// Check if target is in Field-of-view
    /// </summary>
    /// <returns></returns>
	public virtual bool CheckFoV()
	{
		GameObject myTarget = this._myTarget;
		bool result = false;
		Vector3 from = myTarget.transform.position - this.transform.position;
		float num = Vector3.Angle(from, this.transform.forward);
		if (num < (float)100)
		{
			result = true;
		}

		return result;
	}
	/// <summary>
    /// Go straight to target
    /// </summary>
	public virtual void BasicSetGoal()
	{
		GameObject myTarget = this._myTarget;
		_myGoal = myTarget.transform.position;
		_navAgent.destination = _myGoal;
	}

	/// <summary>
    /// Check if is in distance
    /// </summary>
	public virtual void TrackCheckDistanceFromGoal()
	{
		GameObject myTarget = this._myTarget;
		NavMeshAgent navMeshAgent = (NavMeshAgent)this.GetComponent(typeof(NavMeshAgent));
		if (navMeshAgent.remainingDistance < navMeshAgent.stoppingDistance + 0.5f && Vector3.Distance(this.transform.position, myTarget.transform.position) > navMeshAgent.stoppingDistance + 0.5f)
		{
			this.BasicSetGoal();
		}
	}

	/// <summary>
    /// Set a random point near goal
    /// </summary>
	public virtual void SetNearGoal()
	{
		GameObject myTarget = this._myTarget;
		int num = UnityEngine.Random.Range(3, 60);
		Vector3 vector = new Vector3(UnityEngine.Random.Range(-1f, 1f), UnityEngine.Random.Range(-1f, 1f), UnityEngine.Random.Range(-1f, 1f));
		RaycastHit raycastHit = default(RaycastHit);

		if (Physics.Raycast(myTarget.transform.position, vector, out raycastHit, (float)num, this.BlockingLayers))
		{
			this._myGoal = raycastHit.point;
			_navAgent.destination = this._myGoal;
		}
		else
		{
			this._myGoal = vector * (float)num;
			_navAgent.destination = this._myGoal;
		}
	}

	/// <summary>
    /// 
    /// </summary>
	protected void CheckStopMovement()
    {
		if (_navAgent != null)
		{
			if (this._stopMovement <= (float)0)
			{
				_navAgent.speed = this._mySpeed;
			}
			else
			{
				_navAgent.speed = (float)0;
			}
		}

		if (this._stopMovement > (float)0)
		{
			//this.transform.LookAt(new Vector3(this.shottarget.x, this.transform.position.y, this.shottarget.z));
		}
		this._stopMovement -= Time.deltaTime;
	}
}
