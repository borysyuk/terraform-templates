# Unit that depends on ../network, so `run-all` orders network before app.
terraform {
  source = "."
}

dependency "network" {
  config_path = "../network"

  mock_outputs = {
    network_id = "mock-network-id"
  }
}

inputs = {
  network_id = dependency.network.outputs.network_id
}
