package com.example.delta.repository;

import com.example.delta.domain.Os;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OsDao extends CrudRepository<Os,Integer> {
}
