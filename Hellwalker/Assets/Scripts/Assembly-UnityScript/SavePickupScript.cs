﻿using System;
using UnityEngine;

// Token: 0x0200009C RID: 156
[Serializable]
public class SavePickupScript : MonoBehaviour
{
	// Token: 0x060003C5 RID: 965 RVA: 0x00024418 File Offset: 0x00022618
	public virtual void Start()
	{
		this.sav = (SaveManagerScript)GameObject.Find("SaveManager").GetComponent(typeof(SaveManagerScript));
		this.origcoors = this.transform.position;
	}

	// Token: 0x060003C6 RID: 966 RVA: 0x0002445C File Offset: 0x0002265C
	public virtual void Update()
	{
		this.dosavestuff();
	}

	// Token: 0x060003C7 RID: 967 RVA: 0x00024464 File Offset: 0x00022664
	public virtual void dosavestuff()
	{
		string rhs = null;
		if (this.sav.dosave || this.sav.doload)
		{
			rhs = "?tag=" + this.transform.gameObject.name + this.origcoors.ToString();
		}
		if (this.sav.dosave)
		{
			ES2.Save<Transform>(this.transform, this.sav.filename + rhs + "tr4n5orm");
		}
		if (this.sav.doload)
		{
			if (ES2.Exists(this.sav.filename + rhs + "tr4n5orm"))
			{
				ES2.Load<Transform>(this.sav.filename + rhs + "tr4n5orm", this.transform);
			}
			else
			{
				UnityEngine.Object.Destroy(this.transform.gameObject);
			}
		}
	}

	// Token: 0x060003C8 RID: 968 RVA: 0x00024564 File Offset: 0x00022764
	public virtual void Main()
	{
	}

	// Token: 0x040004A9 RID: 1193
	[HideInInspector]
	public SaveManagerScript sav;

	// Token: 0x040004AA RID: 1194
	[HideInInspector]
	public Vector3 origcoors;
}