trigger OrderTrigger on Order (
  before insert,
  before update,
  before delete,
  after insert,
  after update,
  after delete,
  after undelete
){
    switch on Trigger.operationType {
    when BEFORE_INSERT {
        OrderHelper.AddDefaultPricebook(Trigger.new);
    }
    when BEFORE_UPDATE {
    }
    when BEFORE_DELETE {
    }
    when AFTER_INSERT {
        OrderHelper.AddPortableInstallation(Trigger.new);
    }
    when AFTER_UPDATE {
    }
    when AFTER_DELETE {
    }
    when AFTER_UNDELETE {
    }
  }
}