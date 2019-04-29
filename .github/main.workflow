workflow "New workflow" {
  on = "push"
  resolves = ["GitHub Action for Maven"]
}

action "GitHub Action for npm" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
}

action "GitHub Action for Maven" {
  uses = "LucaFeger/action-maven-cli@765e218a50f02a12a7596dc9e7321fc385888a27"
  needs = ["GitHub Action for npm"]
}

workflow "New workflow 1" {
  on = "push"
  resolves = ["Filters for GitHub Actions"]
}

action "GitHub Action for Maven-1" {
  uses = "LucaFeger/action-maven-cli@765e218a50f02a12a7596dc9e7321fc385888a27"
}

action "Filters for GitHub Actions" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  needs = ["GitHub Action for Maven-1"]
  secrets = ["tt"]
  env = {
    tt = "tt"
  }
}
