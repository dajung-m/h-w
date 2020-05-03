#include<cstdio>
bool Fpair[10][10];
int n;
int Friendspair(bool taken[10]){
	int first=-1;
	for(int i=0;i<n;i++) if(!taken[i]) first=i;
	if(first==-1) return 1;
	int sum=0;
	for(int pair=first+1;pair<n;pair++){
		if(Fpair[first][pair]&&(!taken[pair])){
			taken[first]=true;
			taken[pair]=true;
			sum+=Friendspair(taken);
			taken[first]=false;
			taken[pair]=false;
		}
	}
	return sum;
}
int main(){
	int tset;
	scanf("%d",&tset);
	bool taken[10]={false};
	while(tset--){
		int m,m1,m2;
		scanf("%d %d",&n,&m);
		for(int i=0;i<n;i++) {
			scanf("%d %d",m1,m2);
			Fpair[m1][m2]=true;
		}
		int sum=Friendspair(taken);
		printf("%d",sum);
		for(int i=0;i<n;i++) 
			for(int j=0;j<n;j++)
				Fpair[i][j]=false;
	}

}
