terraform {
}

resource "aws_accessanalyzer_analyzer" "region_analyzer" {
  provider      = aws
  analyzer_name = "${var.accessanalyzer_name}-${data.aws_region.current.name}"
  tags = merge(var.tags, {
    name        = "${var.accessanalyzer_name}-${data.aws_region.current.name}"
    account     = data.aws_caller_identity.current.account_id
    environment = var.accessanalyzer_name
  })
}
