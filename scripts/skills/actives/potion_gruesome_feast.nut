//FEATURE_2: add gruesome feast ai to nonplayers
this.potion_gruesome_feast <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.potion_gruesome_feast";
		this.m.Name = "Gruesome Feast";
		this.m.Description = "Feast on a corpse to regain health and cure injuries. Will daze and disgust any ally within four tiles.";
		this.m.Icon = "skills/gruesome_square.png";
		this.m.IconDisabled = "skills/gruesome_square_bw.png";
		this.m.Overlay = "gruesome_square";
		this.m.SoundOnUse = [
			"sounds/enemies/gruesome_feast_01.wav",
			"sounds/enemies/gruesome_feast_02.wav",
			"sounds/enemies/gruesome_feast_03.wav"
		];
		this.m.Type = ::Const.SkillType.Active;
		this.m.Order = ::Const.SkillOrder.UtilityTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsTargetingActor = false;
		this.m.IsVisibleTileNeeded = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsAudibleWhenHidden = false;
		this.m.IsUsingActorPitch = true;
		this.m.ActionPointCost = 7;
		this.m.FatigueCost = 40;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
		this.m.MaxLevelDifference = 4;
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
				type = "text",
				text = this.getCostString()
			}
		];
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (_targetTile.IsEmpty)
		{
			return false;
		}

		if (!_targetTile.IsCorpseSpawned)
		{
			return false;
		}

		if (!_targetTile.Properties.get("Corpse").IsConsumable)
		{
			return false;
		}

		return true;
	}

	function spawnBloodbath( _targetTile )
	{
		for( local i = 0; i != ::Const.CorpsePart.len(); i = i )
		{
			_targetTile.spawnDetail(::Const.CorpsePart[i]);
			i = ++i;
		}

		for( local i = 0; i != 6; i = i )
		{
			if (!_targetTile.hasNextTile(i))
			{
			}
			else
			{
				local tile = _targetTile.getNextTile(i);

				for( local n = this.Math.rand(0, 2); n != 0; n = n )
				{
					local decal = ::Const.BloodDecals[::Const.BloodType.Red][this.Math.rand(0, ::Const.BloodDecals[::Const.BloodType.Red].len() - 1)];
					tile.spawnDetail(decal);
					n = --n;
				}
			}

			i = ++i;
		}

		local myTile = this.getContainer().getActor().getTile();

		for( local n = 2; n != 0; n = n )
		{
			local decal = ::Const.BloodDecals[::Const.BloodType.Red][this.Math.rand(0, ::Const.BloodDecals[::Const.BloodType.Red].len() - 1)];
			myTile.spawnDetail(decal);
			n = --n;
		}
	}

	function onRemoveCorpse( _tag )
	{
		this.Tactical.Entities.removeCorpse(_tag);
		_tag.clear(::Const.Tactical.DetailFlag.Corpse);
		_tag.Properties.remove("Corpse");
		_tag.Properties.remove("IsSpawningFlies");
	}

	function onUse( _user, _targetTile )
	{
		_targetTile = _user.getTile();

		if (_targetTile.IsVisibleForPlayer)
		{
			if (::Const.Tactical.GruesomeFeastParticles.len() != 0)
			{
				for( local i = 0; i < ::Const.Tactical.GruesomeFeastParticles.len(); i = i )
				{
					this.Tactical.spawnParticleEffect(false, ::Const.Tactical.GruesomeFeastParticles[i].Brushes, _targetTile, ::Const.Tactical.GruesomeFeastParticles[i].Delay, ::Const.Tactical.GruesomeFeastParticles[i].Quantity, ::Const.Tactical.GruesomeFeastParticles[i].LifeTimeQuantity, ::Const.Tactical.GruesomeFeastParticles[i].SpawnRate, ::Const.Tactical.GruesomeFeastParticles[i].Stages);
					i = ++i;
				}
			}

			if (_user.isDiscovered() && (!_user.isHiddenToPlayer() || _targetTile.IsVisibleForPlayer))
			{
				this.Tactical.EventLog.log(::Const.UI.getColorizedEntityName(_user) + " feasts on a corpse");
			}
		}

		if (!_user.isHiddenToPlayer())
		{
			this.Time.scheduleEvent(this.TimeUnit.Virtual, 500, this.onRemoveCorpse, _targetTile);
		}
		else
		{
			this.onRemoveCorpse(_targetTile);
		}

		this.spawnBloodbath(_targetTile);
		_user.setHitpoints(this.Math.min(_user.getHitpoints() + 50, _user.getHitpointsMax()));
		local skills = _user.getSkills().getAllSkillsOfType(::Const.SkillType.Injury);

		foreach( s in skills )
		{
			s.removeSelf();
		}

		local actors = this.Tactical.Entities.getInstancesOfFaction(_user.getFaction());

		foreach( a in actors )
		{
			if (a.getID() == _user.getID())
			{
				continue;
			}

			if (_user.getTile().getDistanceTo(a.getTile()) > 4)
			{
				continue;
			}

			if (a.getFaction() != _user.getFaction())
			{
				continue;
			}

			a.getSkills().add(::new("scripts/skills/effects/legend_dazed_effect"));
			a.worsenMood(2.0, "Witnessed someone eat a corpse");
		}

		_user.onUpdateInjuryLayer();
		return true;
	}

});

