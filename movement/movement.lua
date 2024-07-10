local amun = amun
local Translator = require('./translate')
local Rotator = require('./rotate')
Movement = {splines_ = {}, translate = {}, rotate = {}}

function Movement:new(number_of_robots)
    for i=0, number_of_robots-1 
    do
        self.splines_[i] = { t_start = 0, t_end = math.huge,
                        x = { a0 = 0, a1 = 0, a2 = 0, a3 = 0 },
                        y = { a0 = 0, a1 = 0, a2 = 0, a3 = 0 },
                        phi = { a0 = 0, a1 = 0, a2 = 0, a3 = 0 }
                    }
        self.translate[i] = Translator:new(i, self.splines_[i])
        self.rotate[i] = Rotator:new(i, self.splines_[i])
    end
end

function Movement:set_position(robot, pos)
    if id > #splines_ then
        log("movement : unknown robot")
    end
    else
        pos = pos or {x=robot.pos.x, y=robot.pos.y, phi=robot.dir}
        Translator[robot.id].set_position({pos.x, pos.y})
        Rotator[robot.id].set_position(pos.phi)
    end
end

function Movement:set_velocity(robot, v)
    if id > #splines_ then
        log("movement : unknown robot")
    end
    else
        v = v or {x=robot.speed.x, y=robot.speed.y, phi=robot.angularSpeed}
        Translator[robot.id].set_velocity({v.x, v.y})
        Rotator[robot.id].set_velocity(v.phi)
    end
end
    
function Movement:set_acceleration(robot, a)
    if id > #splines_ then
        log("movement : unknown robot")
    end
    else
        Translator[robot.id].set_acceleration({a.x, a.y})
        Rotator[robot.id].set_acceleration(a.phi)
    end
end
    
function Movement:set_jerk(robot, j)
    if id > #splines_ then
        log("movement : unknown robot")
    end
    else
        Translator[robot.id].set_jerk({j.x, j.y})
        Rotator[robot.id].set_jerk(j.phi)
    end
end
 
        




        
        