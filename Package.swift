import PackageDescription

let package = Package(
    name: "PilotPlantCatalog",
    dependencies: [
        //.Package(url: "https://github.com/lingostar/PilotPlant", majorVersion: 1, minor: 0)
        .Package(url: "https://github.com/lingostar/PilotPlant", versions: Version(1,0,0)...Version(1,0,0))
        ]
)
