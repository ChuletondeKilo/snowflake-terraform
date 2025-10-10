resource "snowflake_resource_monitor" "rsc_monitor_developers" {
  name         = "RSC_MON_DEVELOPERS_${var.env_name}"
  credit_quota = var.env_name == "PROD" ? 100 : 50

  frequency       = "MONTHLY"
  start_timestamp = "2025-10-01 00:00"
  end_timestamp   = "2035-12-07 00:00"

  notify_triggers           = [40, 50, 70]
  suspend_trigger           = 85
  suspend_immediate_trigger = 95

}

resource "snowflake_resource_monitor" "rsc_monitor_integration" {
  name         = "RSC_MON_INT_${var.env_name}"
  credit_quota = var.env_name == "PROD" ? 100 : 50

  frequency       = "MONTHLY"
  start_timestamp = "2025-10-01 00:00"
  end_timestamp   = "2035-12-07 00:00"

  notify_triggers           = [40, 50, 70]
  suspend_trigger           = 85
  suspend_immediate_trigger = 95

}

resource "snowflake_resource_monitor" "rsc_monitor_transform" {
  name         = "RSC_MON_TRANSFORM_${var.env_name}"
  credit_quota = var.env_name == "PROD" ? 100 : 50

  frequency       = "MONTHLY"
  start_timestamp = "2025-10-01 00:00"
  end_timestamp   = "2035-12-07 00:00"

  notify_triggers           = [40, 50, 70]
  suspend_trigger           = 85
  suspend_immediate_trigger = 95

}

resource "snowflake_resource_monitor" "rsc_monitor_consumer" {
  name         = "RSC_MON_CONSUMER_${var.env_name}"
  credit_quota = var.env_name == "PROD" ? 100 : 50

  frequency       = "MONTHLY"
  start_timestamp = "2025-10-01 00:00"
  end_timestamp   = "2035-12-07 00:00"

  notify_triggers           = [40, 50, 70]
  suspend_trigger           = 85
  suspend_immediate_trigger = 95

}