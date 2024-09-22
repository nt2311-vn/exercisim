using System;

abstract class Character
{
    public string _characterType;

    protected Character(string characterType)
    {
        _characterType = characterType;
    }

    public abstract int DamagePoints(Character target);

    public virtual bool Vulnerable() => false;

    public override string ToString() => $"Character is a {_characterType}";
}

class Warrior : Character
{
    public Warrior()
        : base("Warrior") { }

    public override int DamagePoints(Character target) => target.Vulnerable() ? 10 : 6;
}

class Wizard : Character
{
    private bool _isPrepared = false;

    public Wizard()
        : base("Wizard") { }

    public override int DamagePoints(Character target) => _isPrepared ? 12 : 3;

    public override bool Vulnerable() => _isPrepared ? false : true;

    public void PrepareSpell()
    {
        _isPrepared = true;
    }
}
