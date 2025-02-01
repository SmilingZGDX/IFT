package com.example.bndb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.bndb.entity.User;
public interface UserRepository extends JpaRepository<User, Long> {
}