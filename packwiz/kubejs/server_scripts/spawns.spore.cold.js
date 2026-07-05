EntityEvents.spawned(event => {
    let entity = event.entity
    let entityType = entity.type

    if (entityType.toString().startsWith('spore:')) {

        let world = event.level
        let pos = entity.blockPosition()
        let x = pos.x, y = pos.y, z = pos.z

        let biomeTemp = coldsweat.getBiomeTemperature(world, pos)

        if (biomeTemp <= -1) {
            event.cancel()
            return
        }
        if (biomeTemp <= -0.43) {
            if (Math.random() < 0.5) {
                event.cancel()
            }
        }

        let maxDist = 16 * 12
        let nearestPlayer = null
        let nearestDist = maxDist

        for (let player of world.players) {
            let dx = player.x - x, dy = player.y - y, dz = player.z - z
            let dist = Math.sqrt(dx * dx + dy * dy + dz * dz)
            if (dist < nearestDist) {
                nearestDist = dist
                nearestPlayer = player
            }
        }

        if (!nearestPlayer) return

        let worldTemp = coldsweat.getTemperatureAt(world, nearestPlayer.blockPosition())

        if (worldTemp <= 0) {
            event.cancel()
        } else if (worldTemp < 0.43) {
            if (Math.random() < 0.5) {
                event.cancel()
            }
        }
    }
})
