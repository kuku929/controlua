Rotator = {spline_ = {}, id_=nil}
function Rotator:new(o, robot_id, spline)
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

function Rotator:set_position(pos)
    self.splines_[self.id_].phi.a0 = pos  
end

function Rotator:set_velocity(omega)
    self.splines_[self.id_].phi.a1 = omega 
end

function Rotator:set_acceleration(id_, alpha)
    self.splines_[self.id_].phi.a2 = alpha 
end

function Rotator:set_jerk(j)
    self.splines_[self.id_].phi.a3 = j
end

return Rotator
-- obj = Rotator:new()
-- obj:sayhi()
