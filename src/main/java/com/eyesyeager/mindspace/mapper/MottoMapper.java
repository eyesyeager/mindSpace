package com.eyesyeager.mindspace.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.eyesyeager.mindspace.model.entity.Motto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MottoMapper extends BaseMapper<Motto> {

    @Select("select * from motto where status = #{status} order by RAND(UNIX_TIMESTAMP(CURDATE())) limit #{size}")
    List<Motto> getRandomMottoList(int status, int size);
}
