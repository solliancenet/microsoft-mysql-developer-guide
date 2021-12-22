package com.contoso.noshnowapi.repositories;

import com.contoso.noshnowapi.models.Item;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ItemRepository extends JpaRepository<Item, Long> {
    List<Item> findByCategory(Integer categoryId);
}