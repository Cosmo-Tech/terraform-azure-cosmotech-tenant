locals {
  crds = [
    "argoproj.io_clusterworkflowtemplates.yaml",
    "argoproj.io_cronworkflows.yaml",
    "argoproj.io_workfloweventbindings.yaml",
    "argoproj.io_workflows.yaml",
    "argoproj.io_workflowtaskresults.yaml",
    "argoproj.io_workflowtasksets.yaml",
    "argoproj.io_workflowtemplates.yaml"
  ]
}

data "http" "argo_crds" {
  for_each = toset(local.crds)
  url      = "https://raw.githubusercontent.com/argoproj/argo-workflows/${var.argo_version}/manifests/base/crds/minimal/${each.key}"
}

data "kubectl_file_documents" "argo_crds" {
  for_each = data.http.argo_crds
  content  = each.value.response_body
}

resource "kubectl_manifest" "argo_crds" {
  for_each  = data.kubectl_file_documents.argo_crds
  yaml_body = data.kubectl_file_documents.argo_crds[each.key].documents[0]
}