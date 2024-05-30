<script setup lang="ts">
const { data: materials } = await useFetch('/api/materials');
</script>

<template>
    <div class="page-foodAdditivesList">
        <h1>海外食品添加物規制早見表</h1>
        <h2>登録添加物一覧</h2>
        <div class="list" v-if="materials && materials.length > 0">
            <table>
                <thead>
                    <tr>
                        <th>和名</th>
                        <th>英名</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="material in materials" :key="material.id">
                        <td>{{ material.name }}</td>
                        <td>{{ material.english_name }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>