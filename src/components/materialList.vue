<script setup lang="ts">
// route取得
const route = useRoute();

// formの入れ物作成
const formdata = useState('formdata', () => ({
    q: route.query.q || ''
}))

// 検索処理の定義
const search = async () => {
    console.log(`search() is called!!${process.server ? '(server)' : '(client)'}`);

    // materialsの取得
    const data = await $fetch('/api/materials', {
        params: formdata.value
    });
    return data;
}

// materialsの入れ物作成
const { data: materials, error, refresh } = await useAsyncData('materials', () => search())

// パラメータ更新時の処理
onBeforeRouteUpdate((to, from) => {
    console.log('onBeforeRouteUpdate() is called!!');
    refresh();
})
</script>

<template>
    <div class="list" v-if="materials && materials.length > 0">
        <table>
            <thead>
                <tr>
                    <th>和名</th>
                    <th>英名</th>
                    <th>米国</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="material in materials" :key="material.id">
                    <td>{{ material.name }}</td>
                    <td>{{ material.english_name }}</td>
                    <td>{{ material.english_name }}</td>
                </tr>
            </tbody>
        </table>
    </div>
</template>