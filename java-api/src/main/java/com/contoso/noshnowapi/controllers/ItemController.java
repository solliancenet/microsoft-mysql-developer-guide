package com.contoso.noshnowapi.controllers;

import com.contoso.noshnowapi.models.Item;
import com.contoso.noshnowapi.repositories.ItemRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/items")
public class ItemController {
    private final ItemRepository itemRepository;

    public ItemController(ItemRepository itemRepository)
    {
        this.itemRepository = itemRepository;
    }

    @GetMapping
    public List<Item> getItems()
    {
        return itemRepository.findAll();
    }

    @GetMapping("/categories/{categoryId}")
    public List<Item> getItemsByCategory(@PathVariable Integer categoryId)
    {
        return itemRepository.findByCategory(categoryId);
    }

    @GetMapping("/{id}")
    public Item getItem(@PathVariable Long id)
    {
        return itemRepository.findById(id).orElseThrow();
    }
}
