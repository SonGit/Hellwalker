﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Pistol : Weapon
{
    // References to scene objects
    ParticleSystem rightpistolparticles; //References to the RIGHT pistol particles

    // Use this for initialization
    protected override void Start () {
        base.Start();

        rightpistolparticles = GetComponentInChildren<ParticleSystem>();
    }

    // Update is called once per frame
    protected override void Update () {

        bool keyInput = this.inputmanager.GetKeyInput("fire", 2);

        if (this.inputmanager.GetKeyInput("fire", 0))
        {
            this.doattack = true;
        }

        if (keyInput)
        {
            this.doattack = false;
        }

        this.AttackDelayTimer -= Time.deltaTime;

        if (this.AttackDelayTimer < (float)0)
        {
            this.AttackDelayTimer = (float)0;
        }

        if (this.AttackDelayTimer <= (float)0)
        {
            if (doattack)
            {
                animator.SetTrigger("PistolFireTrigger");
                weaponData.traceroffset = 0.1f;
                this.AttackDelayTimer = weaponData.WeaponSpeed / weaponData.FireSpeed;
                this.didattack = false;
            }
        }

        if (!this.didattack)
        {
            if (this.AttackDelayTimer <= weaponData.AttackFrame)
            {
                ((MyMouseLook)Camera.main.GetComponent(typeof(MyMouseLook))).buck = weaponData.Buck;

                rightpistolparticles.Play();

                //rightpistolshells.Emit(1);

                float num3 = weaponData.Inaccuracy;

                GameObject go = this.shootbullet(num3, (float)1000, 1, 24, 0, (float)3, (float)1, true, false);

                ((WeaponFlashScript)GameObject.Find("WeaponFlash").GetComponent(typeof(WeaponFlashScript))).flash = (float)20;
                this.didattack = true;
            }
        }
    }


}
