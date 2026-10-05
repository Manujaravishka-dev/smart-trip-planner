import { Ionicons } from '@expo/vector-icons';
import { LinearGradient } from 'expo-linear-gradient';
import { router } from 'expo-router';
import { ScrollView, StyleSheet, Text, TextInput, TouchableOpacity, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

const destinations = [
  { name: 'Ella', note: 'Mountains & views', icon: 'leaf-outline' as const },
  { name: 'Galle', note: 'Coast & heritage', icon: 'sunny-outline' as const },
  { name: 'Kandy', note: 'Culture & nature', icon: 'flower-outline' as const },
];

export default function HomeScreen() {
  return (
    <SafeAreaView style={styles.safe}>
      <ScrollView contentContainerStyle={styles.page} showsVerticalScrollIndicator={false}>
        <View style={styles.header}>
          <View style={styles.avatar}><Text style={styles.avatarText}>M</Text></View>
          <View style={{ flex: 1 }}>
            <Text style={styles.eyebrow}>GOOD AFTERNOON</Text>
            <Text style={styles.heading}>Where to next?</Text>
          </View>
          <TouchableOpacity style={styles.iconButton}><Ionicons name="notifications-outline" size={22} /></TouchableOpacity>
        </View>

        <View style={styles.search}>
          <Ionicons name="search" size={21} color="#66706B" />
          <TextInput placeholder="Search a destination" placeholderTextColor="#8B928E" style={styles.searchInput} />
          <TouchableOpacity style={styles.filter}><Ionicons name="options-outline" size={19} color="white" /></TouchableOpacity>
        </View>

        <View style={styles.sectionHead}>
          <Text style={styles.sectionTitle}>Upcoming trip</Text>
          <Text style={styles.link}>View all</Text>
        </View>

        <TouchableOpacity activeOpacity={0.9} onPress={() => router.push('/trip')}>
          <LinearGradient colors={['#1B786B', '#123D48']} start={{x:0,y:0}} end={{x:1,y:1}} style={styles.hero}>
            <View style={styles.heroTop}>
              <View style={styles.pill}><Ionicons name="time-outline" color="white" size={15}/><Text style={styles.pillText}> 8 days to go</Text></View>
              <Ionicons name="ellipsis-horizontal" color="white" size={24}/>
            </View>
            <View style={{ flex: 1 }} />
            <Text style={styles.heroLabel}>SRI LANKA</Text>
            <Text style={styles.heroTitle}>Ella Weekend</Text>
            <Text style={styles.heroMeta}>Oct 13 – Oct 15   •   4 travelers</Text>
            <View style={styles.heroBottom}>
              <View style={styles.faces}>{['M','S','N','+1'].map(x => <View key={x} style={styles.face}><Text style={styles.faceText}>{x}</Text></View>)}</View>
              <View style={styles.open}><Ionicons name="arrow-forward" color="#173E42" size={20}/></View>
            </View>
          </LinearGradient>
        </TouchableOpacity>

        <View style={styles.quickRow}>
          <TouchableOpacity style={styles.quick} onPress={() => router.push('/create-trip')}><Ionicons name="add-circle-outline" size={25} color="#176D62"/><Text style={styles.quickText}>New trip</Text></TouchableOpacity>
          <TouchableOpacity style={styles.quick}><Ionicons name="people-outline" size={25} color="#176D62"/><Text style={styles.quickText}>Join group</Text></TouchableOpacity>
          <TouchableOpacity style={styles.quick}><Ionicons name="bookmark-outline" size={25} color="#176D62"/><Text style={styles.quickText}>Saved</Text></TouchableOpacity>
        </View>

        <View style={styles.sectionHead}><Text style={styles.sectionTitle}>Explore Sri Lanka</Text><Text style={styles.link}>See all</Text></View>
        <ScrollView horizontal showsHorizontalScrollIndicator={false} contentContainerStyle={{ gap: 12 }}>
          {destinations.map(d => (
            <TouchableOpacity key={d.name} style={styles.destination}>
              <View style={styles.destinationIcon}><Ionicons name={d.icon} size={28} color="#176D62"/></View>
              <View style={{ flex: 1 }}><Text style={styles.destinationName}>{d.name}</Text><Text style={styles.destinationNote}>{d.note}</Text></View>
              <Ionicons name="arrow-up-outline" size={18} style={{ transform: [{ rotate: '45deg' }] }} />
            </TouchableOpacity>
          ))}
        </ScrollView>
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe:{flex:1,backgroundColor:'#F6F7F2'},page:{padding:20,paddingBottom:40},header:{flexDirection:'row',alignItems:'center',gap:12,marginBottom:24},avatar:{width:48,height:48,borderRadius:18,backgroundColor:'#173E42',alignItems:'center',justifyContent:'center'},avatarText:{color:'white',fontWeight:'800',fontSize:17},eyebrow:{fontSize:10,letterSpacing:1.5,color:'#78807C',fontWeight:'700'},heading:{fontSize:25,fontWeight:'800',color:'#14211E'},iconButton:{width:44,height:44,borderRadius:16,backgroundColor:'white',alignItems:'center',justifyContent:'center'},search:{height:58,borderRadius:20,backgroundColor:'white',flexDirection:'row',alignItems:'center',paddingLeft:17,paddingRight:8,gap:10},searchInput:{flex:1,fontSize:15,color:'#17211F'},filter:{width:42,height:42,borderRadius:15,backgroundColor:'#176D62',alignItems:'center',justifyContent:'center'},sectionHead:{flexDirection:'row',justifyContent:'space-between',alignItems:'center',marginTop:27,marginBottom:13},sectionTitle:{fontSize:20,fontWeight:'800',color:'#14211E'},link:{fontSize:13,fontWeight:'700',color:'#176D62'},hero:{height:265,borderRadius:30,padding:20},heroTop:{flexDirection:'row',justifyContent:'space-between'},pill:{flexDirection:'row',alignItems:'center',backgroundColor:'rgba(255,255,255,.16)',paddingHorizontal:12,paddingVertical:8,borderRadius:30},pillText:{color:'white',fontWeight:'700',fontSize:12},heroLabel:{fontSize:10,letterSpacing:2,color:'#B9DDD5',fontWeight:'800'},heroTitle:{color:'white',fontSize:29,fontWeight:'900',marginTop:3},heroMeta:{color:'#D5E7E2',fontSize:13,marginTop:5},heroBottom:{flexDirection:'row',alignItems:'center',justifyContent:'space-between',marginTop:18},faces:{flexDirection:'row'},face:{width:34,height:34,borderRadius:17,backgroundColor:'rgba(255,255,255,.2)',borderWidth:1,borderColor:'rgba(255,255,255,.4)',alignItems:'center',justifyContent:'center',marginRight:-5},faceText:{color:'white',fontWeight:'800',fontSize:11},open:{width:40,height:40,borderRadius:16,backgroundColor:'white',alignItems:'center',justifyContent:'center'},quickRow:{flexDirection:'row',gap:10,marginTop:16},quick:{flex:1,backgroundColor:'white',borderRadius:20,paddingVertical:16,alignItems:'center',gap:7},quickText:{fontSize:11,fontWeight:'700',color:'#27312E'},destination:{width:220,height:108,borderRadius:24,backgroundColor:'white',padding:14,flexDirection:'row',alignItems:'center',gap:12},destinationIcon:{width:55,height:55,borderRadius:18,backgroundColor:'#E6F2EE',alignItems:'center',justifyContent:'center'},destinationName:{fontSize:17,fontWeight:'800',color:'#14211E'},destinationNote:{fontSize:11,color:'#7A827E',marginTop:3}
});