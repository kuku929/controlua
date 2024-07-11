Translator = {spline_ = {}, id_=nil}

function Translator:new(o, robot_id, spline)
    -- for i=0,number_of_robots-1 do
    --     self.splines_[i] = { t_start = 0, t_end = math.huge,
    --                     x = { a0 = 0, a1 = 0.5, a2 = 0, a3 = 0 },
    --                     y = { a0 = 0, a1 = 0, a2 = 0, a3 = 0 },
    --                     phi = { a0 = 0, a1 = 0, a2 = 0, a3 = 0 }
    --                 }
    self.spline_ = spline
    self.id_ = robot_id 
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o 

end

function Translator:set_position(pos)
    self.spline_[self.id_].x.a0 = pos.x
    self.spline_[self.id_].y.a0 = pos.y
end


function Translator:set_velocity(v)
    -- if robot.id > #splines_ then
    --     log("Translator : unknown robot id")
    -- end
    -- local robot_vel =  {robot.speed.x, robot.speed.y, robot.angularSpeed}
    -- v = v or robot_vel
    self.spline_[self.id_].x.a1 = v.x
    self.spline_[self.id_].y.a1 = v.y
end

function Translator:set_acceleration(a)
    self.spline_[self.id_].x.a2 = a.x
    self.spline_[self.id_].y.a2 = a.y
end


function Translator:set_jerk(j)
    self.spline_[self.id_].x.a3 = j.x
    self.spline_[self.id_].y.a3 = j.y
end

return Translator
-- obj = Translator:new()
-- obj:sayhi()
