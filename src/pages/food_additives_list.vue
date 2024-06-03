<script setup lang="ts">

console.log(`page-foodad start${process.server ? '(server)' : '(client)'}`);

</script>

<template>
    <div class="page-foodAdditivesList">
        <h1>海外食品添加物規制早見表</h1>
        <h2>登録添加物一覧</h2>
        <SearchFrom />
        <MaterialList />
        <NuxtLink to="/">トップページへ</NuxtLink>
    </div>
</template>