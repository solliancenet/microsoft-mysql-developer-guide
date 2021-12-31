package com.contoso.noshnowapi.repositories;

import com.contoso.noshnowapi.models.Item;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ItemRepository extends JpaRepository<Item, Long>, ItemRepositoryCustom {
}