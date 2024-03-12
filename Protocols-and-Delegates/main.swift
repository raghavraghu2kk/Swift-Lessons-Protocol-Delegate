protocol AdvancedLifeSuppor {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSuppor?
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSuppor {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("Doing CPR")
    }
}

class Doctor: AdvancedLifeSuppor {
    
    init(handler : EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("Do CPR - The Doctor")
    }
    
    func useStethescope() {
        print("Listening for heart sound")
    }
}

class Surgeon: Doctor {
    
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the BeeGees")
    }
    
    override func useStethescope() {
        super.useStethescope()
    }
    
    func useElectricShock() {
        print("Shock")
    }
}



let emilio = EmergencyCallHandler()
let angela = Surgeon(handler: emilio)
//let docotor = Doctor(handler: emilio)
//let pete = Paramedic(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()
