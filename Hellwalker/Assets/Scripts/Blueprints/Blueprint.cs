using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public enum BlueprintState
{
    IDLE = 0,
    AGGRO = 1,
}

// Blueprint requires the Animator to have a Finite State Machine
[RequireComponent(typeof(Animator))]
public class Blueprint : MonoBehaviour
{
    [SerializeField] protected Animator _fsm;

    [SerializeField] private BlueprintState _currentState;

    // Start is called before the first frame update
    void Start()
    {
        Initialize();
    }

    public void SetState(BlueprintState state)
    {
        _currentState = state;
    }

    public BlueprintState GetState()
    {
        return _currentState;
    }

    // Update is called once per frame
    void Update()
    {
        UpdateState((int)_currentState);
    }

    protected void Initialize()
    {
        _fsm = this.GetComponent<Animator>();
    }

    protected void UpdateState(int stateAsInt)
    {
        SubstateFix();
        _fsm.SetInteger("State", stateAsInt);
    }

    protected int _lastSubstate = 0;
    protected void SubstateFix()
    {
        int currentSubstate = _fsm.GetInteger("State");

        if(currentSubstate != _lastSubstate)
        {
            _fsm.SetBool("SubstateChange",false);
        }
        else
        {
            _fsm.SetBool("SubstateChange", true);
        }

        _lastSubstate = currentSubstate;
    }

}
